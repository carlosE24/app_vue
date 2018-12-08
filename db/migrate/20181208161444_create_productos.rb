class CreateProductos < ActiveRecord::Migration[5.2]
  def change
    create_table :productos do |t|
      t.string :nombre_producto
      t.string :precio
      t.timestamps
    end
  end
end
