class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :content
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
