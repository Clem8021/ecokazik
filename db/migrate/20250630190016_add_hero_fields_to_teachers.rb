class AddHeroFieldsToTeachers < ActiveRecord::Migration[8.0]
  def change
    add_column :teachers, :superpower, :string
    add_column :teachers, :background, :text
    add_column :teachers, :catchphrase, :string
  end
end
