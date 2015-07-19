class AddPaperclipFieldsToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :image_file_name,    :string
    add_column :categories, :image_content_type, :string
    add_column :categories, :image_file_size,    :integer
    add_column :categories, :image_updated_at,   :datetime
  end
end
