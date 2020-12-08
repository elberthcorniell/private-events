class AttendanceController < ApplicationController
  before_action :set_attandance, only: %i[show edit update destroy]

  # GET /attandances
  # GET /attandances.json
  def index
    @attandances = Attandance.all
  end

  # GET /attandances/1
  # GET /attandances/1.json
  def show; end

  # GET /attandances/new
  def new
    @attandance = Attandance.new
  end

  # GET /attandances/1/edit
  def edit; end

  # POST /attandances
  # POST /attandances.json
  def create
    @attandance = Attandance.new(attandance_params)

    respond_to do |format|
      if @attandance.save
        format.html { redirect_to @attandance, notice: 'Attandance was successfully created.' }
        format.json { render :show, status: :created, location: @attandance }
      else
        format.html { render :new }
        format.json { render json: @attandance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attandances/1
  # PATCH/PUT /attandances/1.json
  def update
    respond_to do |format|
      if @attandance.update(attandance_params)
        format.html { redirect_to @attandance, notice: 'Attandance was successfully updated.' }
        format.json { render :show, status: :ok, location: @attandance }
      else
        format.html { render :edit }
        format.json { render json: @attandance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attandances/1
  # DELETE /attandances/1.json
  def destroy
    @attandance.destroy
    respond_to do |format|
      format.html { redirect_to attandances_url, notice: 'Attandance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_attandance
    @attandance = Attandance.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def attandance_params
    params.require(:attandance).permit(:attendee_id, :users, :attended_event_id)
  end
end
