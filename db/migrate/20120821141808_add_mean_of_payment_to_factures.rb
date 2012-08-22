class AddMeanOfPaymentToFactures < ActiveRecord::Migration
  def change
    add_column :factures, :mean_of_payment, :string
  end
end
