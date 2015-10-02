class AddDetailsToGroop < ActiveRecord::Migration
  def change
    add_column :groops, :details, :string
  end
end
