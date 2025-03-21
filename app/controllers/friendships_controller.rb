class FriendshipsController < ApplicationController
  def create
    @friendship = Current.user.friendships.build(friend_id: params[:friend_id])

    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:error] = "Unable to add friend."
      redirect_to root_url
    end
  end

  def destroy
    @friendship = Current.user.friendships.find(params[:id])
    raise
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to Current.user
  end
end
