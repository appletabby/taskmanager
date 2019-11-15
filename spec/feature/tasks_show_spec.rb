require 'rails_helper'

RSpec.feature "TasksShow", type: :feature do
  before(:each) do
    @task = FactoryBot.create(:task)
  end
  scenario "show page can see task content" do
    visit task_path(@task)
    expect(page).to have_content "優先順序"
    expect(page).to have_content "目前狀態"
  end

end