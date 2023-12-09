class TodosController < ApplicationController
  before_action :set_todo, only: %i[ show edit update destroy ]
  before_action :find_all_sections, except: [:destroy]

  # GET /todos or /todos.json
  def index
    @todos = Todo.all
  end

  # GET /todos/1 or /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
    @todo = Todo.find(params.require(:id))
  end

  # POST /todos or /todos.json
  def create
    @todo = Todo.new(todo_create_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to new_todo_path, notice: "Todo '" + @todo.title + "' was successfully created." }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1 or /todos/1.json
  def update
    @todo.section_id = todo_update_params[:sectionId]
    @todo.save
    render :new
  end

  # DELETE /todos/1 or /todos/1.json
  def destroy
    @todo.destroy!

    respond_to do |format|
      format.html { redirect_to new_todo_path, notice: "Todo '" + @todo.title + "' was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_create_params
      params.require(:todo).permit(:title)
    end

    def todo_update_params
      params.permit(:title, :position, :sectionId, :id)
    end

    def find_all_sections
      @sections = Section.all
    end
end
