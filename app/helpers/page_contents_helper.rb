module PageContentsHelper
  # Map known slugs to friendly names, sensible default otherwise.
  def pretty_page_name(page_or_slug)
    slug = page_or_slug.respond_to?(:slug) ? page_or_slug.slug.to_s : page_or_slug.to_s
    case slug
    when "welcome_page"  then "Welcome Page"
    when "about_page"    then "About Page"
    when "services_page" then "Services Page"
    else slug.titleize
    end
  end

  # Helpful hint text for text color choice
  def text_color_help
    "Choose ‘Light’ for white text (best on dark photos) or ‘Dark’ for black text (best on light photos)."
  end
end