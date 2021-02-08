class HabitsController < ApplicationController
  before_action :set_habit, only: %i[ show edit update destroy ]

  # GET /habits or /habits.json
  def index
    @habits = Habit.by_category_id(params[:category_id])
                   .by_date(params[:date])
  end

  def today
    @habits = Habit.by_date(Date.today.to_s)

    render :index
  end

  # GET /habits/1 or /habits/1.json
  def show
  end

  # GET /habits/new
  def new
    @habit = Habit.new(
      goal: 1,
      start_date: Time.current,
      repeat: Habit.build_repeat,
      reminders: [Habit.build_reminder]
    )
  end

  # GET /habits/1/edit
  def edit
  end

  # POST /habits or /habits.json
  def create
    @habit = Habit.new(habit_params)

    respond_to do |format|
      if @habit.save
        format.html { redirect_to @habit, notice: "Habit was successfully created." }
        format.json { render :show, status: :created, location: @habit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @habit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /habits/1 or /habits/1.json
  def update
    respond_to do |format|
      if @habit.update(habit_params)
        format.html { redirect_to @habit, notice: "Habit was successfully updated." }
        format.json { render :show, status: :ok, location: @habit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @habit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /habits/1 or /habits/1.json
  def destroy
    @habit.destroy
    respond_to do |format|
      format.html { redirect_to habits_url, notice: "Habit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_habit
      @habit = Habit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def habit_params
      params.require(:habit).permit(:category_id, :name, :goal, :time_period, :start_date, :is_bad, repeat: %i[each period weekdays], reminders: %i[remind_at])
    end
end
