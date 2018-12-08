class Detalle < ApplicationRecord
    belongs_to :orden
    belongs_to :producto
  end