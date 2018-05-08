class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.order(date: :desc)
    # Venue.includes(:events).near("Brisbane, Qld")
    # .order("events.date")
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    if current_user.has_role? :admin or current_user.has_role? :host
      @event = Event.new
    else
      flash[:notice] = "You must be logged in as a host"
      redirect_to events_path
    end


  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    not_authorized and return unless current_user.can_create_event?

    @event = Event.new(event_params)
    @event.user = current_user

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
    not_authorized and return unless current_user.can_update_event?(@event)
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
    not_authorized and return unless current_user.can_delete_event?(@event)
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
      params.require(:event).permit(:image, :title, :date, :time, :about, :user_id, :venue_id, :cause_id)
    end

    def not_authorized
      flash[:notice] = "You are not authorized"
      redirect_to events_path
    end
end
