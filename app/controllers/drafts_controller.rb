class DraftsController < ApplicationController
  before_action :find_draft, only: %i[edit update]
  def index
    @draft = Draft.new
    @drafts = Draft.active.order(created_at: :desc)
  end

  def new; end

  def create
    @draft = Draft.new(draft_params)
    respond_to do |format|
      if @draft.save
        format.js { redirect_to drafts_url, notice: 'ドラフトを追加しました' }
      else
        @object = @draft
        format.js { render 'shared/err_msg', status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    if @draft.update(draft_params)
      redirect_to drafts_url, notice: 'ドラフトを編集しました'
    else
      render :edit
    end
  end

  private

  def draft_params
    params.require(:draft).permit(:content, :url)
  end

  def find_draft
    @draft = Draft.find(params[:id])
  end
end
