class CreateClassStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :class_statuses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :class_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
