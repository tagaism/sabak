class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :title
      t.references :course, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
