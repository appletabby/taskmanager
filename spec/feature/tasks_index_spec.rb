require 'rails_helper'

RSpec.feature "TasksIndex", type: :feature do
  before(:each) do
    @task = FactoryBot.create(:task)
  end
  scenario "index page can see tasks" do
    visit tasks_path
    expect(page).to have_content "任務內容"
    expect(page).to have_content "優先順序"
  end

  scenario "index page can visit new page" do
    visit tasks_path
    click_on '新增任務'
    expect(page).to have_current_path(new_task_path)
  end
  
  scenario "index page can visit show page" do
    visit tasks_path
    click_on 'content'
    expect(page).to have_current_path(task_path(@task))
  end
  
  scenario "index page can visit edit page" do
    visit tasks_path
    click_on '編輯'
    expect(page).to have_current_path(edit_task_path(@task))
  end
  
  scenario "index page can delete tasks" do
    visit tasks_path
    expect { click_link '刪除' }.to change(Task, :count).by(-1)
  end

end