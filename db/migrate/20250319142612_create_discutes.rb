class CreateDiscutes < ActiveRecord::Migration[8.0]
  def change
    create_table :discutes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :discussion, null: false, foreign_key: true
      t.string :role, null: false, default: "initiateur"

      t.timestamps
    end
  end
end
