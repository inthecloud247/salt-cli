module Salt
  module Commands
    class Highstate < BaseCommand
      def run(args=[])
        require_master_server!
        Salt::Commands::Upload.new(provider, config.merge(name: "master")).run([])
        vm = find name
        salt_cmd vm, 'saltutil.sync_all'
        salt_cmd vm, 'mine.update'
        salt_cmd vm, "state.highstate"
      end
    end
  end
end

Salt.register_command "highstate", Salt::Commands::Highstate