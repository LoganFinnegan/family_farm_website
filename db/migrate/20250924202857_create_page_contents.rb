class CreatePageContents < ActiveRecord::Migration[7.2]
  def change
    create_table :page_contents do |t|
      t.string  :slug, null: false
      t.string  :title
      t.text    :subtitle   # this will be the paragraph on the hero
      t.text    :body
      t.string  :text_color, default: "light"   # "light" (white) or "dark" (black)
      t.string  :overlay_color, default: "#000000"
      t.integer :overlay_opacity, default: 40    # 0..100

      t.timestamps
    end

    add_index :page_contents, :slug, unique: true
  end
end