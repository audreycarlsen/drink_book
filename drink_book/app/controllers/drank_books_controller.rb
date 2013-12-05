class DrankBooksController < ApplicationController
  before_action :set_drank_book, only: [:show, :edit, :update, :destroy]

  # GET /drank_books
  # GET /drank_books.json
  def index
    @drank_books = DrankBook.all
  end

  # GET /drank_books/1
  # GET /drank_books/1.json
  def show
  end

  # GET /drank_books/new
  def new
    @drank_book = DrankBook.new
    @recipes = Recipe.all.collect { |p| [p.name, p.id] }
  end

  # GET /drank_books/1/edit
  def edit
    @recipes = Recipe.all.collect { |p| [p.name, p.id] }
  end

  # POST /drank_books
  # POST /drank_books.json
  def create
    @drank_book = DrankBook.new(drank_book_params)

    params[:drank_book][:recipes].each do |recipe_id|
      next if recipe_id.to_i == 0
      @drank_book.recipes << Recipe.find(recipe_id.to_i)
    end

    respond_to do |format|
      if @drank_book.save
        format.html { redirect_to @drank_book, notice: 'Drank book was successfully created.' }
        format.json { render action: 'show', status: :created, location: @drank_book }
      else
        format.html { render action: 'new' }
        format.json { render json: @drank_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drank_books/1
  # PATCH/PUT /drank_books/1.json
  def update
    respond_to do |format|
      if @drank_book.update(drank_book_params)
        params[:drank_book][:recipes].each do |recipe_id|
          next if recipe_id.to_i == 0
          @drank_book.recipes << Recipe.find(recipe_id.to_i)
        end

        format.html { redirect_to @drank_book, notice: 'Drank book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @drank_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drank_books/1
  # DELETE /drank_books/1.json
  def destroy
    @drank_book.destroy
    respond_to do |format|
      format.html { redirect_to drank_books_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drank_book
      @drank_book = DrankBook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drank_book_params
      params.require(:drank_book).permit(:name, :description, :recipes => {})
    end
end
