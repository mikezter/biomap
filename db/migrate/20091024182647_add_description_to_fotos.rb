class AddDescriptionToFotos < ActiveRecord::Migration
  def self.up
    add_column :fotos, :description, :text
  end

  def self.down
    remove_column :fotos, :description
  end
end
