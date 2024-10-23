class AddCreditsToClassLists < ActiveRecord::Migration[6.0]
  def change
    add_column :class_lists, :credits, :integer
  end
end
