class CreateDetalles < ActiveRecord::Migration[5.2]
  def change
    create_table :detalles do |t|
      t.references :orden, foreign_key: true
      t.references :producto, foreign_key: true
      t.integer :cantidad
      t.float :precio_venta
      t.timestamps
    end
  end
end
