class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  # GET /venues
  # GET /venues.json
  def index
    @venues = Venue.all
  end

  # GET /venues/1
  # GET /venues/1.json
  def show
  end

  # GET /venues/new
  def new
    if user_signed_in? && (current_user.has_role? :admin or current_user.has_role? :venue)
    @venue = Venue.new
    else
      flash[:notice] = "You are not authorized"
      redirect_to venues_path
    end

  end

  def myvenue

    if Venue.where(user_id: current_user.id).count != 0
      @venue = Venue.where(user_id: current_user.id).first
      redirect_to venue_path(@venue)
    else
      redirect_to new_venue_path
    end
    # if Venue.where(user_id: current_user.id).count != 0
    #   render venue_path(Venue.find()
    # else
    #   render new_venue_path
    # end

  end

  # GET /venues/1/edit
  def edit
    # not_authorized and return unless user_signed_in? and current_user.can_update_venue?
  end

  # POST /venues
  # POST /venues.json
  def create
    not_authorized and return unless user_signed_in? and current_user.can_create_venue?
    has_one_venue and return unless Venue.where(user_id: current_user.id).count == 0
    @venue = Venue.new(venue_params)
    @venue.user_id = current_user.id
    @venue.save
    respond_to do |format|
      if @venue.save
        format.html { redirect_to @venue, notice: 'Venue was successfully created.' }
        format.json { render :show, status: :created, location: @venue }
      else
        format.html { render :new }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /venues/1
  # PATCH/PUT /venues/1.json
  def update
    not_authorized and return unless user_signed_in? and current_user.can_update_venue?(@venue)
    respond_to do |format|
      if @venue.update(venue_params)
        format.html { redirect_to @venue, notice: 'Venue was successfully updated.' }
        format.json { render :show, status: :ok, location: @venue }
      else
        format.html { render :edit }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.json
  def destroy
    not_authorized and return unless user_signed_in? and current_user.can_delete_venue?(@venue)
    @venue.destroy
    respond_to do |format|
      format.html { redirect_to venues_url, notice: 'Venue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue
      @venue = Venue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venue_params
      params.require(:venue).permit(:image, :name, :phone_number, :email, :website, :style, :about, :street_address, :city, :state, :country, :post_code)
    end

    def not_authorized
      flash[:notice] = "You are not authorized"
      redirect_to venues_path
    end

    def has_one_venue
      flash[:notice] = "You can only have one venue"
      redirect_to venues_path
    end
end
