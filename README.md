# README

**Model：User** 

欄位名稱 資料型態 說明 

name string 姓名 

email string 電郵


**Model：Task** 

欄位名稱 資料型態 說明 

content text 任務內容

priority integer 優先順序（high、medium、low）

status integer 目前狀態（to_do、in_progress、done）

started_at datetime 任務開始時間

ended_at datetime 任務結束時間

user_id integer 此任務的user編號


**Model：Tag**

欄位名稱 資料型態 說明

title string 標籤名稱

task_id integer 此標籤的task編號