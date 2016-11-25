class RecipeTitlesController < ApplicationController
  before_action :set_recipe_title, only: [:show, :edit, :update, :destroy]

  # GET /recipe_titles
  # GET /recipe_titles.json
  def index
    @recipe_titles = RecipeTitle.all
  end

  # GET /recipe_titles/1
  # GET /recipe_titles/1.json
  def show
  end

  # GET /recipe_titles/new
  def new
    @recipe_title = RecipeTitle.new
  end

  # GET /recipe_titles/1/edit
  def edit
  end

  # POST /recipe_titles
  # POST /recipe_titles.json
  def create
    @recipe_title = RecipeTitle.new(recipe_title_params)

    respond_to do |format|
      if @recipe_title.save
        format.html { redirect_to @recipe_title, notice: 'Recipe title was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_title }
      else
        format.html { render :new }
        format.json { render json: @recipe_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_titles/1
  # PATCH/PUT /recipe_titles/1.json
  def update
    respond_to do |format|
      if @recipe_title.update(recipe_title_params)
        format.html { redirect_to @recipe_title, notice: 'Recipe title was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe_title }
      else
        format.html { render :edit }
        format.json { render json: @recipe_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_titles/1
  # DELETE /recipe_titles/1.json
  def destroy
    @recipe_title.destroy
    respond_to do |format|
      format.html { redirect_to recipe_titles_url, notice: 'Recipe title was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_title
      @recipe_title = RecipeTitle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_title_params
      params.require(:recipe_title).permit(:name, :category, :ingredient)
    end
end
