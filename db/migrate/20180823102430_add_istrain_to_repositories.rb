class AddIstrainToRepositories < ActiveRecord::Migration
  def change
    add_column :repositories, :istrain, :bool, default: false
  end
end
