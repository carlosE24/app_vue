class CreateOrdens < ActiveRecord::Migration[5.2]
  def change
    create_table :ordens do |t|
      t.references :cliente, foreign_key: true
      t.datetime :fecha

      t.timestamps
    end
  end
end
