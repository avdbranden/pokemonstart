class AddLabelToMoves < ActiveRecord::Migration
  def change
    add_column :moves, :label, :string
  end
end
