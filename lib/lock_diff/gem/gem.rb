module LockDiff
  module Gem
    class Gem
      extend Forwardable

      attr_reader :name
      def_delegator :@ruby_gem, :github_url

      def initialize(name)
        @name = name
        @ruby_gem = RubyGem.new(name)
      end

      def url
        @ruby_gem.github_url || @ruby_gem.homepage_url
      end

      def repository
        Github::RepositoryNameDetector.new(@ruby_gem.github_url).call
      end

    end
  end
end
