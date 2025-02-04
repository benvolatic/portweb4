class CreateResumes < ActiveRecord::Migration[8.0]
  def change
    create_table :resumes do |t|
      t.string :file
      t.boolean :current

      t.timestamps
    end
  end
end
