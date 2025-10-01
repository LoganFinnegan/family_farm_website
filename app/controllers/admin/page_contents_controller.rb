class Admin::PageContentsController < Admin::BaseController
  before_action :set_page_content, only: [:edit, :update]

  def index
    @page_contents = PageContent.order(:slug)
  end

  def edit; end

  def update
    if @page_content.update(page_content_params)
      redirect_to admin_page_contents_path, notice: "Updated #{@page_content.slug.humanize}!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_page_content
    @page_content = PageContent.find(params[:id])
  end

  def page_content_params
    params.require(:page_content).permit(
      :title,
      :subtitle,     # paragraph
      :body,         # optional longer text
      :text_color,   # "light" or "dark" for BOTH title & paragraph
      :hero_image    # ActiveStorage file input
    )
  end
end