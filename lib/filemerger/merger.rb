require 'filemerger/poster'
require 'filemerger/searcher'
require 'xcodeproj'

module Filemerger
  class Merger
    def self.merge_files(config)
      first_mask_files = Searcher.find_files_for_mask(config.masks.first, config.working_folders)

      if first_mask_files.count == 0
        Poster.post_nothing_found
        exit
      end

      project = Xcodeproj::Project.open(config.xcode_project)

      first_mask_files.each do |first_mask_file|
        file_name = File.basename(first_mask_file).to_s.chomp(config.masks.first)
        content = ""
        config.masks.each do |mask|
          file = File.dirname(first_mask_file) + "/" + file_name + mask
          if File.exist?(file)
            content += File.readlines(file).join() + "\n"
            delete_file_if_needed(file, project, config)
          else
            Poster.post_file_not_found(file)
          end
        end

        new_file_name = File.dirname(first_mask_file) + "/" + file_name + config.result_mask
        File.open(new_file_name, "w") { |f| f.puts content }
        Poster.post_file_created(new_file_name)

        group = project[File.dirname(first_mask_file)]
        xcode_file = group.new_file(file_name + config.result_mask)
        targets = obtain_target(project, config.xcode_targets)
        targets.each do |t|
          t.add_file_references([xcode_file])
        end
      end
      Poster.post_merge_finished
      project.save
    end

    private

    def self.delete_file_if_needed(file, project, config)
      if config.delete_old_files
        delete_file_from_build_phases(file, project, config)

        File.delete(file)
      end
    end

    def self.delete_file_from_build_phases(file, project, config)
      build_phases = build_phases_from_targets(project, config.xcode_targets)
      return if build_phases.nil?

      build_phases.each do |build_phase|
        build_phase.files.each do |build_file|
          next if build_file.nil? || build_file.file_ref.nil?

          build_file_path = configure_file_ref_path(build_file.file_ref)
          if build_file_path == file
            build_file.file_ref.remove_from_project
          end
        end
      end
    end

    def self.configure_file_ref_path(file_ref)
      build_file_ref_path = file_ref.hierarchy_path.to_s
      build_file_ref_path[0] = ''

      build_file_ref_path
    end

    def self.build_phases_from_targets(project, target_names)
      build_phases = []

      target_names.each do |target_name|
        xcode_target = obtain_target(project, target_name)
        xcode_target.build_phases.each do |build_phase|
          if build_phase.isa == 'PBXSourcesBuildPhase'
            build_phases.push(build_phase)
          end
        end
      end

      build_phases
    end

    def self.obtain_target(project, target_name)
      project.targets.each do |target|
        return target if target.name == target_name
      end
    end

  end
end
