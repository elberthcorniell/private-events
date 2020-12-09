# rubocop:disable Style/GuardClause

class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  # before action :user_logged_in, only: %i[show index]
  # GET /events
  # GET /events.json
  def index
    if user_logged_in
      @past_events = Event.prev_events
      @upcoming_events = Event.upcoming_events
      @created_events = current_user.events
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    user_logged_in
  end

  # GET /events/new
  def new
    @event = Event.new if user_logged_in
  end

  # GET /events/1/edit
  def edit; end

  # POST /events
  # POST /events.json
  def create
    @event = current_user.events.build(event_params) if user_logged_in
    respond_to do |format|
      if @event.save
        Attendance.create(attendee_id: current_user.id, attended_event_id: @event.id)
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

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:title, :date)
  end

  def user_logged_in
    if current_user
      true
    else
      redirect_to new_user_session_url
      false
    end
  end
end

# rubocop:enable Style/GuardClause
