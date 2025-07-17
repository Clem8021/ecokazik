class CreateTeachers < ActiveRecord::Migration[8.0]
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :instrument
      t.text :bio
      t.string :photo_url

      t.timestamps
    end
  end
end
