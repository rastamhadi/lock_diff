module BundleDiffLinker
  module Gem
    class Version
      extend Forwardable

      def_delegators :@spec, :rivision, :version

      def initialize(gem:, spec:)
        @gem = gem
        @spec = spec
      end

      def ref
        git_tag || rivision
      end

      def to_s
        version.to_s
      end

      private

      def git_tag
        version_str = version.to_s
        @gem.tag_names.find do |tag_name|
          tag_name == version_str ||
            tag_name == "v#{version_str}" ||
            tag_name == "#{@gem.name}-#{version_str}"
        end
      end

    end
  end
end
