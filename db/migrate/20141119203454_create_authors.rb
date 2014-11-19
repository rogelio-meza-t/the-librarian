class CreateAuthors < ActiveRecord::Migration
  def change
    #autors table
    create_table :authors do |t|
      t.string :name
    end

    #many to many relationship
    create_table :authorings do |t|
      t.integer :author
      t.integer :book
    end

    Book.all.each do |book|
      autor = Author.where(name: book.author).limit(1).first

      if author.nil?
        author = Author.create({:name => book.author})
      end

      #create many-to-many relationship
      Authoring.create({:author => author.id, :book => book.id})
    end

    #delete author column from books
    remove_column :books, :author
  end
end
