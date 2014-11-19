class EditorialToModel < ActiveRecord::Migration

  def up
    #create the new table
    create_table(:editorials) do |t|
      t.string :name, null: false, default: ""
    end
    add_index :editorials, :name, unique: true

    #temporally rename editorial column (for compatibility with Editorial model)
    rename_column :books, :editorial, :editorial_old

    #add reference to editorial into book
    add_column :books, :editorial_id, :integer

    #for each book, take the editorial's name and creates a new editorial or updates its editorial reference
    Book.all.each do |book|
      editorial = Editorial.where(name: book.editorial_old).limit(1).first

      if editorial.nil?
        editorial = Editorial.create({:name => book.editorial_old})
      end

      book.editorial_id = editorial.id
      book.save!
    end

    #remove the editorial_old colum from books
    remove_column :books, :editorial_old
  end
end
