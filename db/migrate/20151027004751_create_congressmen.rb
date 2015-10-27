class CreateCongressmen < ActiveRecord::Migration
  def change
    create_table :congressmen do |t|
      t.string :name
      t.string :ej
      t.string :area
      t.string :lecture

      t.timestamps null: false
    end
  end
end
