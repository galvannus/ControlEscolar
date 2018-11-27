class CreatePartials < ActiveRecord::Migration[5.1]
  def change
    create_table :partials do |t|
      t.integer :number_partial

      t.timestamps
    end
  end
end
