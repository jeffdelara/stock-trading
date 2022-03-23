class AddCashToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :cash, :float, :default => 100_000
  end
end
