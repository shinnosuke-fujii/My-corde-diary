class CreateMcdTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :mcd_tag_relations do |t|
      t.references :mcd, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
