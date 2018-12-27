class CreateInspections < ActiveRecord::Migration[5.2]
  def change
    create_table :inspections do |t|
      t.references :part, foreign_key: true
      t.references :code, foreign_key: true
      t.references :maintenance, foreign_key: true

      t.timestamps
    end
  end
end
