class CreateCompetitionEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :competition_entries do |t|
      t.references :team, foreign_key: true
      t.references :competition, foreign_key: true

      t.timestamps
    end
  end
end
