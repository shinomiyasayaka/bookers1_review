class Book < ApplicationRecord
  
  validates :title, presence: true
  validates :body, presence: true
#validatesで対象とする項目を指定し、入力されたデータのpresence（存在）をチェックします。trueと記述すると、データが存在しなければならないという設定
  
end
