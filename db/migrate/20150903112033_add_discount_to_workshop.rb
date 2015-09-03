class AddDiscountToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :discount, :integer
  end
end
