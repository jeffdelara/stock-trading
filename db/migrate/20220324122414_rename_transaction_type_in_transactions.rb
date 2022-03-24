class RenameTransactionTypeInTransactions < ActiveRecord::Migration[6.1]
  def change
    rename_column :transactions, :transaction_type, :transaction_type_id
  end
end
