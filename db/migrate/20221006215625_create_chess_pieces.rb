class CreateChessPieces < ActiveRecord::Migration[7.0]
  def change
    create_table :chess_pieces do |t|
      t.integer :x
      t.integer :y
      t.integer :kind
      t.integer :colour

      t.timestamps
    end
  end
end
