class RequestsController < ApplicationController
# before_action :request_params, only: [:create]
  def index
    @requests = Request.where(user_id: current_user.id)
  end

  def create
    @request = Request.new(venue_id: params[:venue_id])
    @request.user_id = current_user.id
    @request.save
    @venue = Venue.find(venue_id: params[:venue_id])
    email = @venue.user.email
    user = current_user.id
    flash[:notice] = "You have successfully created a request"
    RequestEventMailer.send_request(email, user).deliver_now

    redirect_to Venue.find(params[:venue_id])

    return

  end

private

  def request_params
    params.require(:request).permit(:user_id, :venue_id, :open)
  end
end
