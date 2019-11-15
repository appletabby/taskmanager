require 'rails_helper'

RSpec.feature "TasksNew", type: :feature do
  before(:each) do
    @task = FactoryBot.create(:task)
  end
  scenario "new page can create tasks" do
    visit new_task_path
    fill_in "任務內容", with: "new content"
    expect { click_on 'Create Task' }.to change(Task, :count).by(+1)
  end

  scenario "new page can return to index page" do
    visit new_task_path
    click_on '回任務列表'
    expect(page).to have_current_path(tasks_path)
  end

end