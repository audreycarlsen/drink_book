require 'test_helper'

class DrankBooksControllerTest < ActionController::TestCase
  setup do
    @drank_book = drank_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drank_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create drank_book" do
    assert_difference('DrankBook.count') do
      post :create, drank_book: { description: @drank_book.description, name: @drank_book.name }
    end

    assert_redirected_to drank_book_path(assigns(:drank_book))
  end

  test "should show drank_book" do
    get :show, id: @drank_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @drank_book
    assert_response :success
  end

  test "should update drank_book" do
    patch :update, id: @drank_book, drank_book: { description: @drank_book.description, name: @drank_book.name }
    assert_redirected_to drank_book_path(assigns(:drank_book))
  end

  test "should destroy drank_book" do
    assert_difference('DrankBook.count', -1) do
      delete :destroy, id: @drank_book
    end

    assert_redirected_to drank_books_path
  end
end
