require 'rails_helper'

RSpec.feature "TasksEdit", type: :feature do
  before(:each) do
    @task = FactoryBot.create(:task)
  end
  scenario "edit page can update tasks" do
    visit edit_task_path(@task)
    fill_in "任務內容", with: "update content"
    click_on 'Update Task'
    expect(page).to have_content "update content"
  end

  scenario "edit page can return to index page" do
    visit edit_task_path(@task)
    click_on '回任務列表'
    expect(page).to have_current_path(tasks_path)
  end

end