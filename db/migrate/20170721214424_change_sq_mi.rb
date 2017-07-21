class ChangeSqMi < ActiveRecord::Migration[5.1]
  def change
    change_column :parks, :sq_mi, :integer
  end
end
