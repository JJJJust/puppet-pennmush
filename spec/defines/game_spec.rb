require 'spec_helper'

describe 'pennmush::game', :type => 'define' do

  # Any integer
  intany = [
    'starting_money',
    'paycheck',
    'guest_paycheck',
    'max_pennies',
    'max_guest_pennies',
    'starting_quota',
    'player_queue_limit',
    'queue_chunk',
    'active_queue_chunk',
    'function_recursion_limit',
    'function_invocation_limit',
    'call_limit',
    'queue_entry_cpu_time',
    'max_channels',
    'max_player_chans',
    'max_parents',
    'max_depth',
    'max_global_fns',
    'chan_cost',
    'max_attrs_per_obj',
    'mail_limit',
    'kill_min_cost',
    'kill_default_cost',
    'kill_bonus',
    'find_cost',
    'page_cost',
    'quota_cost',
    'queue_cost',
    'queue_loss',
    'room_cost',
    'object_cost',
    'link_cost',
    'float_precision',
    'player_name_len',
    'max_aliases'
    ]

  # Any integer >= 0
  intGTE0 = [
    'player_start',
    'default_home',
    'chunk_cache_memory',
    'max_logins',
    'max_dbref'
    ]

  # Any integer >= -1
  intGTEn1 = [
    'ancestor_room',
    'ancestor_thing',
    'ancestor_player',
    'max_guests']

  # Variables that require any integer between 0 and 100, inclusive.
  int0_100 = [
    'whisper_loudness'
    ]

  # Variables that require a valid port (RFC 6335)
  rfcPort = [
    'port',
    'ssl_port'
    ]

  # Variables that trigger creation of alias_puppet.cnf
  aliases = {
    'reserve_aliases' => 'reserve_alias',
    'command_aliases' => 'command_alias',
    'function_aliases' => 'function_alias',
    'attribute_aliases' => 'attribute_alias' }

  # Static integers used in testing
  integers = {
    'neg' => '-999',
    'neg1' => '-1',
    'pos' => '999',
    'false' => "ABC",
    'portValidA' => '1701',
    'portValidB' => '1702',
    'portLoInvalid' => '-99999',
    'portHiInvalid' => '99999'
    }

  let(:params) { { :gamedir => "/home/test_user/pennmush/game" } }
  let(:title) { 'RSpecTestMUSH' }

  context 'when $gamedir' do

      context 'is undefined' do
        let(:params) do
          super().merge( {:gamedir => nil } )
        end
        it { is_expected.to raise_error(Puppet::Error) }
      end

      context 'is not an absolute path' do
        let(:params) do
          super().merge( {:gamedir => 'mush.cnf' } )
        end
        it { is_expected.to raise_error(Puppet::Error) }
      end
  end

  context "when variable's expected value" do

    context 'is any integer' do
      intany.each do |var|

      context "and $#{var} is given #{integers['pos']}" do
        let(:params) do
          super().merge( { :"#{var}" => "#{integers['pos']}"} )
        end
        it { is_expected.not_to raise_error() }
      end

      context "and $#{var} is given #{integers['neg']}" do
        let(:params) do
          super().merge( { :"#{var}" => "#{integers['pos']}"} )
        end
        it { is_expected.not_to raise_error() }
      end


      context "and $#{var} is given #{integers['false']}" do
        let(:params) do
            super().merge( { :"#{var}" => "#{integers['false']}"} )
        end
        it { is_expected.to raise_error(Puppet::Error) }
      end
      end
    end

    context "is any integer >= 0" do
      intGTE0.each do |var|

      context "and $#{var} is given #{integers['neg']}" do
        let(:params) do
          super().merge( { :"#{var}" => "#{integers['neg']}" } )
        end
          it { is_expected.to raise_error(Puppet::Error) }
        end

      context "and $#{var} is given 0" do
        let(:params) do
          super().merge( { :"#{var}" => '0'} )
        end
        it { is_expected.not_to raise_error }
      end

      context "and $#{var} is given #{integers['pos']}" do
        let(:params) do
          super().merge( { :"#{var}" => "#{integers['pos']}" } )
        end
        it { is_expected.not_to raise_error }
      end

      context "and $#{var} is given #{integers['false']}" do
        let(:params) do
          super().merge( { :"#{var}" => "#{integers['false']}" } )
        end
        it { is_expected.to raise_error(Puppet::Error) }
      end
    end
    end

    context "is any integer >= -1" do
      intGTEn1.each do |var|

      context "and $#{var} is given #{integers['neg']}" do
        let(:params) do
          super().merge( { :"#{var}" => "#{integers['neg']}" } )
        end
        it { is_expected.to raise_error(Puppet::Error) }
      end

      context "and $#{var} is given #{integers['neg1']}" do
        let(:params) do
          super().merge( { :"#{var}" => "#{integers['neg1']}" } )
        end
        it { is_expected.not_to raise_error }
      end

      context "and $#{var} is given 0" do
        let(:params) do
          super().merge( { :"#{var}" => '0'} )
        end
        it { is_expected.not_to raise_error }
      end

      context "and $#{var} is given #{integers['pos']}" do
        let(:params) do
          super().merge( { :"#{var}" => "#{integers['pos']}" } )
        end
        it { is_expected.not_to raise_error }
      end

      context "and $#{var} is given a non-integer" do
        let(:params) do
          super().merge( { :"#{var}" => "#{integers['false']}" } )
        end
        it { is_expected.to raise_error(Puppet::Error) }
      end
    end
    end

    context "is between 0 and 100" do
      int0_100.each do |var|

      context "when $#{var} is given -150" do
        let(:params) do
          super().merge( { :"#{var}" => '-150' } )
        end
        it { is_expected.to raise_error(Puppet::Error) }
      end

      context "when $#{var} is given 0" do
        let(:params) do
          super().merge( { :"#{var}" => '0' } )
        end
        it { is_expected.not_to raise_error }
      end

      context "when $#{var} is given 50" do
        let(:params) do
          super().merge( { :"#{var}" => '50' } )
        end
        it { is_expected.not_to raise_error }
      end

      context "when $#{var} is given 150" do
        let(:params) do
          super().merge( { :"#{var}" => '150' } )
        end
        it { is_expected.to raise_error(Puppet::Error) }
      end
  end
  end

    context "is any RFC 6335 port number" do
      rfcPort.each do |var|

      context "and $#{var} is given #{integers['portLoInvalid']}" do
        let(:params) do
          super().merge( { :"#{var}" => "#{integers['portLoInvalid']}"} )
        end
          it { is_expected.to raise_error(Puppet::Error) }
      end

      context "and $#{var} is given #{integers['portValidA']}" do
        let(:params) do
          super().merge( { "#{var}" => "#{integers['portValidA']}"} )
        end
        it { is_expected.not_to raise_error }
      end

      context "and $#{var} is given #{integers['portHiInvalid']}" do
        let(:params) do
          super().merge( { :"#{var}" => "#{integers['portHiInvalid']}"} )
        end
        it { is_expected.to raise_error(Puppet::Error) }
        end

      context "and $#{var} is given #{integers['false']}" do
        let(:params) do
          super().merge( { :"#{var}" => "#{integers['false']}"} )
        end
        it { is_expected.to raise_error(Puppet::Error) }
      end
      end
    end
  end

  context "when $ssl_port is defined" do

    context "as 4201 and $port is NOT defined" do
      let(:params) do
        super().merge( {
          :ssl_port => '4201',
          :port => nil } )
      end
      it { is_expected.to raise_error(Puppet::Error) }
    end

    context "and $port is defined and identical" do
      let(:params) do
        super().merge( {
          :ssl_port => "#{integers['portValidA']}",
          :port => "#{integers['portValidA']}"
        } )
      end
      it { is_expected.to raise_error(Puppet::Error) }
    end

    context "and $port is defined and different" do
      let(:params) do
        super().merge( {
          :ssl_port => "#{integers['PortValidA']}",
          :port => "#{integers['PortValidB']}" } )
      end
      it { is_expected.not_to raise_error }
      end
   end

   context "when in a valid configuration" do
     it do
       is_expected.to contain_file_line('restart_gamedir').with(
         'path' => "#{params[:gamedir]}/restart",
         'line' => "GAMEDIR=#{params[:gamedir]}"
         )
       is_expected.to contain_file('mush.cnf').with(
         'path' => "#{params[:gamedir]}/mush.cnf"
         )
     end

     context "handling an alias variable" do
       context "that expects an array" do
         aliases.each do |var, directive|
           context "and #{var} is defined with an array" do
             let(:params) do
               super().merge( { :"#{var}" => [ 'valid' ] } )
           end
           it do
             pending("module does not yet validate alias input")
             #is_expected.to contain_file('alias_puppet.cnf').with(
             #'path' => "#{params[:gamedir]}/alias_puppet.cnf")
             #is_expected.to contain_file('alias_puppet.cnf').with_content(
             #/(?mi-x:^(#{directive} valid))/)
             fail
           end
          end
         end
       end
     end
   end
end