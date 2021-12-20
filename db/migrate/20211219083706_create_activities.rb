class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.belongs_to :course, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
