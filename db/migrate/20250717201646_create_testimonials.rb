class CreateTestimonials < ActiveRecord::Migration[8.0]
  def change
    create_table :testimonials do |t|
      t.text :content
      t.string :author

      t.timestamps
    end
  end
end
