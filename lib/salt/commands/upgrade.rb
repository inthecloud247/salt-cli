require 'fog'

module Salt
  module Commands
    class Upgrade < BaseCommand
      def run(args=[])
        require_master_server!
        
        dsystem sudo_cmd "apt-get upgrade salt-master"
        dsystem sudo_cmd "service salt-master restart"
        salt_cmd master_server, "pkg.upgrade salt-minion"
        salt_cmd master_server, "service.restart salt-minion"
      end
    end
  end
end

Salt.register_command "upgrade", Salt::Commands::Upgrade