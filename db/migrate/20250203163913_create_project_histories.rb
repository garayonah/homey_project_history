class CreateProjectHistories < ActiveRecord::Migration[8.0]
  def change
    create_table :project_histories do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :comment
      t.string :status_before
      t.string :status_after

      t.timestamps
    end
  end
end
