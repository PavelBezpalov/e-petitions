class AddIpAddressIndexToSignatures < ActiveRecord::Migration
  disable_ddl_transaction!

  def up
    unless index_exists?(:signatures, [:ip_address, :petition_id])
      add_index :signatures, [:ip_address, :petition_id], algorithm: :concurrently
    end
  end

  def down
    if index_exists?(:signatures, [:ip_address, :petition_id])
      remove_index :signatures, [:ip_address, :petition_id]
    end
  end
end
