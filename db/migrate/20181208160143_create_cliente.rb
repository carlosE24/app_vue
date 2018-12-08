class CreateCliente < ActiveRecord::Migration[5.2]
  def change
    create_table :clientes do |t|
      t.string :rfc
      t.string :nombre_cliente
    end
  end
end
