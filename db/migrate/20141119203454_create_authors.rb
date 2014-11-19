class CreateAuthors < ActiveRecord::Migration
  def change
    #autors table
    create_table :authors do |t|
      t.string :name, null: false, default: ""
    end

    #many to many relationship
    create_table :authorings do |t|
      t.integer :author_id
      t.integer :book_id
    end

    rename_column :books, :author, :author_old

    Book.all.each do |book|
      author = Author.where(name: book.author_old).limit(1).first
      if author.nil?
        author = Author.create({:name => book.author_old})
      end

      #create many-to-many relationship
      Authoring.create({:author => author, :book => book})
    end

    #delete author column from books
    remove_column :books, :author_old
  end
end
