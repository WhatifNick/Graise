class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.order(date: :desc)
    # venues = Venue.near("#{current_user.city}, #{current_user.state}").map(&:id)
    # @events = Event.where({ venue_id: venues })

  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    if user_signed_in? && (current_user.has_role? :admin or current_user.has_role? :venue)
      @event = Event.new
    else
      flash[:notice] = "Venues must create events"
      redirect_to events_path
    end


  end

  # GET /events/1/edit
  def edit
    # not_authorized and return unless user_signed_in? and current_user.can_update_event?(@event)
  end

  # POST /events
  # POST /events.json
  def create
    # render plain: params.inspect
    # return

    not_authorized and return unless user_signed_in? and current_user.can_create_event?

    hosts = User.where(email: params['event']['host_email'])
    ep = event_params
    # if (!hosts.empty?)
      ep[:user_id] = hosts.first.id
      ep[:cause_id] = hosts.first.cause_id
    # else
    #   flash[:notice] = "Host email not found"
    #   redirect_to new_event_path
    # end
    @event = Event.new(ep)


    @event.venue = Venue.where(user_id: current_user.id).first
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    not_authorized and return unless user_signed_in? and current_user.can_update_event?(@event)
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    not_authorized and return unless user_signed_in? and current_user.can_delete_event?(@event)
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:image, :title, :date, :time, :about, :venue_id, :cause_id)
    end

    def not_authorized
      flash[:notice] = "You are not authorized"
      redirect_to events_path
    end
end
