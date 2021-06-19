class AddColummTimeWrongToCardwords < ActiveRecord::Migration[6.1]
  def change
    add_column :cardwords, :time_wrong, :integer, :default => 0
  end
end
