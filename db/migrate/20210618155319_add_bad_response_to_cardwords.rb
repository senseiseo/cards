class AddBadResponseToCardwords < ActiveRecord::Migration[6.1]
  def change
    add_column :cardwords, :bad_response, :integer, :default => 0
    #Ex:- :default =>''
  end
end
