class FixColumnNamesForStocksTable < ActiveRecord::Migration[6.1]
  def change
    rename_column :stocks, :ticker, :symbol
    rename_column :stocks, :last_price, :cost_price
    rename_column :stocks, :name, :company_name
  end
end
