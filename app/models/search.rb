class Search < ActiveRecord::Base

	def search_books
		books = Book.all

		books = Book.where("name LIKE ?", "%#{keywords}%") if keywords.present?
		books = Book.where("category LIKE ?", category) if category.present?
		books = Book.where("price >= ?", min_price) if min_price.present?
		books = Book.where("price <= ?", max_price) if max_price.present?
		books = Book.where("isbn LIKE ?", isbn) if isbn.present?

		return books
	end
			
end
