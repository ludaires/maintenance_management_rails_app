class Inspection < ApplicationRecord
  belongs_to :part
  belongs_to :code
  belongs_to :maintenance
end
