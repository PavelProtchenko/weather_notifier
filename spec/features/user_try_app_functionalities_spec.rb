require 'spec_helper'

RSpec.feature "UserTryAppFunctionalities", type: :feature do
  let(:user) { FactoryGirl.create :user }

  scenario 'success' do
    visit '/'

    save_and_open_page
  end
end
