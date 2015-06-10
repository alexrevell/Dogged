class AddRegisteredFieldToDogsTable < ActiveRecord::Migration
  def change
    add_column :dogs, :registered, :boolean, :default => false
    add_column :dogs, :registered_until, :date
  end
end
