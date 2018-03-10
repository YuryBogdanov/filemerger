require 'xcodeproj'

module Filemerger
  class XcodeHelper
    attr_accessor :project
    attr_reader :config

    def initialize(config)
      @project = Xcodeproj::Project.open(config.xcode_project)
      @config = config
    end

    def add_file_to_project(file_path, file_name)
      group = project[File.dirname(file_path)]
      unless group.nil?
        xcode_file = group.new_file(file_name)
        targets = get_targets_from_config
        targets.each do |t|
          t.add_file_references([xcode_file])
        end
        return true
      else
        Poster.post_no_group_found(File.dirname(file_path))
        return false
      end
    end

    def delete_file_from_build_phases(file)
      build_phases = build_phases_from_targets
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

    private

    def get_targets_from_config
      targets = []
      @project.targets.each do |target|
        targets.push(target) if @config.xcode_targets.include?(target.name)
      end
      targets
    end

    def build_phases_from_targets
      build_phases = []
      get_targets_from_config.each do |xcode_target|
        xcode_target.build_phases.each do |build_phase|
          if build_phase.isa == 'PBXSourcesBuildPhase'
            build_phases.push(build_phase)
          end
        end
      end
      build_phases
    end

    def configure_file_ref_path(file_ref)
      build_file_ref_path = file_ref.hierarchy_path.to_s
      build_file_ref_path[0] = ''

      build_file_ref_path
    end
  end
end
