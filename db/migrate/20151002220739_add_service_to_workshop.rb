class AddServiceToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :service, :boolean
  end
end
