class AddIndexesToActiveStorage < ActiveRecord::Migration[6.0]
  def change
    # Add index for the polymorphic association
    unless index_exists?(:active_storage_attachments, [:record_type, :record_id], name: "index_active_storage_attachments_on_record_type_and_record_id")
      add_index :active_storage_attachments, [:record_type, :record_id], name: "index_active_storage_attachments_on_record_type_and_record_id"
    end

    # Add index for the blob_id to speed up blob lookups
    unless index_exists?(:active_storage_attachments, :blob_id)
      add_index :active_storage_attachments, :blob_id
    end
  end
end
