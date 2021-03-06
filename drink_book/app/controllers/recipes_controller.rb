class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    if params[:search]
      @recipes = Recipe.by_ingredient_name(params[:search])
    else
      @recipes = Recipe.all
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all.collect { |p| [p.name, p.id] }
    @drankbooks = DrankBook.all.collect { |p| [p.name, p.id] }
    @tools = Tool.all.collect { |p| [p.name, p.id] }
  end

  # GET /recipes/1/edit
  def edit
    @ingredients = Ingredient.all.collect { |p| [p.name, p.id] }
    @drankbooks = DrankBook.all.collect { |p| [p.name, p.id] }
    @tools = Tool.all.collect { |p| [p.name, p.id] }
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    params[:recipe][:ingredients].each do |ingredient_id|
      next if ingredient_id.to_i == 0
      @recipe.ingredients << Ingredient.find(ingredient_id.to_i)
    end

    params[:recipe][:drank_books].each do |drankbook_id|
      next if drankbook_id.to_i == 0
      @recipe.drank_books << DrankBook.find(drankbook_id.to_i)
    end

    params[:recipe][:tools].each do |tool_id|
      next if tool_id.to_i == 0
      @recipe.tools << Tool.find(tool_id.to_i)
    end

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recipe }
      else
        format.html { render action: 'new' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        params[:recipe][:ingredients].each do |ingredient_id|
          next if ingredient_id.to_i == 0
          @recipe.ingredients << Ingredient.find(ingredient_id.to_i)
        end

        params[:recipe][:drank_books].each do |drankbook_id|
          next if drankbook_id.to_i == 0
          @recipe.drank_books << DrankBook.find(drankbook_id.to_i)
        end

        params[:recipe][:tools].each do |tool_id|
          next if tool_id.to_i == 0
          @recipe.tools << Tool.find(tool_id.to_i)
        end

        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :description, :search, :process, :drank_books => {}, :ingredients => {}, :tools => {})
    end
end
