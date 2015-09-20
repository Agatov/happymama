class AddWorkshopIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :workshop_id, :integer
  end
end
