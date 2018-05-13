class CreateVisitorEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :visitor_entries do |t|
      t.references :room, foreign_key: true
      t.references :visitor, foreign_key: true
      t.string :direction
      t.float :visited_at

      t.timestamps
    end
  end
end
