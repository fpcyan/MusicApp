class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, null: false

      t.timestamps
    end
    change_table :users do |t|
      t.timestamps
    end
  end
end
