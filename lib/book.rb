class Book
  attr_reader :author_first_name,
              :author_last_name,
              :title,
              :publication_date,
              :checked_out
  def initialize(book_details)
    @author_first_name = book_details[:author_first_name]
    @author_last_name = book_details[:author_last_name]
    @title = book_details[:title]
    @publication_date = book_details[:publication_date]
    @checked_out = false
  end

  def author
    @author_first_name.concat(" ", @author_last_name)
  end

  def publication_year
    @publication_date.slice(-4..-1)
  end

  def checked_out?
    @checked_out
  end

  def check_out
    @checked_out = true 
  end

  def return
    @checked_out = false
  end

end 