class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.boolean :self_assignable, default: true
      t.belongs_to :coach, null: true, foreign_key: true

      t.timestamps
    end
  end
end
