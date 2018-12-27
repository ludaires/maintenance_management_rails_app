class CreateCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :codes do |t|
      t.string :code
      t.string :code_type
      t.string :title

      t.timestamps
    end
  end
end
