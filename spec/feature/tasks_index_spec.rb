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

  scenario "tasks are ordered by created time" do
    task_1 = FactoryBot.create(:task, content: 'content1', created_at: '2019-11-25 08:00:00')
    task_2 = FactoryBot.create(:task, content: 'content2', created_at: '2019-11-25 10:00:00')
    
    visit tasks_path
    within 'tbody tr:nth-child(2)' do
      expect(page).to have_text 'content2'
    end
    within 'tbody tr:nth-child(3)' do
      expect(page).to have_text 'content1'
    end
  end

end