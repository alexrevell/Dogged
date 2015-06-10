class RemoveRegisteredFieldFromDogsTable < ActiveRecord::Migration
  def change
    remove_column :dogs, :registered, :boolean, :default => false
  end
end
