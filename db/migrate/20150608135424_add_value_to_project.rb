class AddValueToProject < ActiveRecord::Migration
  def change
    add_column :projects, :startdate, :date
  end
end
