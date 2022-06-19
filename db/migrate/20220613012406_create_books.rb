## $ rails g modelで作成！ deviseで作らない！！[6/13]
class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      
      ## 各カラムの追加 [6/13]
      t.string  :title
      t.text    :body
      t.integer :user_id

      t.timestamps
    end
  end
end
