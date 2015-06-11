require 'spec_helper'

describe 'pennmush', :type => 'class' do
  it { is_expected.to contain_class('pennmush') }

  context 'when config_only is false' do
    let(:params) { { :config_only => false } }

    context 'on Debian' do
      let(:facts) { { :operatingsystem => 'Debian'  } }

      context 'without mysql_support' do
        it { is_expected.to contain_package('pennmush').with_ensure('present') }
      end

      context 'with mysql_support' do
        let(:params) do
          super().merge( { :mysql_support => true } )
        end
        it { is_expected.to contain_package('pennmush-mysql').with_ensure('present') }
      end
    end

    context 'on a non-supported operating system' do
      let(:facts) { { :operatingsystem => nil} }
      it { is_expected.not_to contain_package('pennmush') }
      end
  end

  context 'when config_only is true' do
    let(:params) { { :config_only => true} }
    it { is_expected.not_to contain_package('pennmush')}
  end
end
