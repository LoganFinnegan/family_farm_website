FactoryBot.define do
  factory :page_content do
    slug { "MyString" }
    title { "MyString" }
    subtitle { "MyText" }
    body { "MyText" }
    text_color { "MyString" }
    overlay_color { "MyString" }
    overlay_opacity { 1 }
  end
end
