json.array!(@drank_books) do |drank_book|
  json.extract! drank_book, :id, :name, :description
  json.url drank_book_url(drank_book, format: :json)
end
