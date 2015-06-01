class RemoveNumber < ActiveRecord::Migration
  def change
  	remove_column :documents, :number
  end
end
