class CreateDiscussions < ActiveRecord::Migration[8.0]
  def change
    create_table :discussions do |t|
      t.string :statut, null: false, default: "ouverte"

      t.timestamps
    end
  end
end
