class RemoveTitleFromNotes < ActiveRecord::Migration[8.0]
  def change
    remove_column :notes, :title, :string
  end
end
