class DraftsController < ApplicationController
  before_action :find_draft, only: %i[edit update]
  def index
    @draft = Draft.new
    @drafts = Draft.all
  end

  def new; end

  def create
    @draft = Draft.new(draft_params)
    if @draft.save
      redirect_to drafts_url, notice: 'ドラフトを追加しました'
    else
      @drafts = Draft.all
      render :index
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
