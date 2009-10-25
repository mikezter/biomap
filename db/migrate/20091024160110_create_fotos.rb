class CreateFotos < ActiveRecord::Migration
  def self.up
    create_table :fotos do |t|
      t.string :name
      t.float :lat
      t.float :lng
      t.timestamps
    end
  end
  
  def self.down
    drop_table :fotos
  end
end
