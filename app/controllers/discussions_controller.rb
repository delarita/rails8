class DiscussionsController < ApplicationController
  before_action :set_discussion, only: %i[ show edit update destroy ]

  def index
    @discussions = Current.user.discussions
  end

  def show
    authorise_user
  end

  def new
    @discussion = Discussion.new
  end

  def edit
    authorise_user
  end

  def create
    @discussion = Discussion.new(discussion_params)
    @discussion.users << Current.user

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to @discussion, notice: "discussion was successfully created." }
        format.json { render :show, status: :created, location: @discussion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
    @discussion.destroy!

    respond_to do |format|
      format.html { redirect_to discussions_path, status: :see_other, notice: "discussion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def authorise_user
    unless Current.user.id == @discussion.discutes.find_by(user_id: Current.user.id).user_id
      redirect_to root_path, alert: "You are not authorised to access this page"
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_discussion
    if Discussion.exists?(params.expect(:id))
      @discussion = Discussion.find(params.expect(:id))
    else
      redirect_to root_path, alert: "Discussion not found"
    end
  end

  def discussion_params
    params.expect(discussion: [ :statut ])
  end
end
