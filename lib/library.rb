class Library
  attr_reader :name,
              :books,
              :authors
  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def book(title)
    @books.find {|book| book.title == title}
  end

  def add_author(author)
    author.books.each do |book|
      @books.push(book)
    end
    @authors.push(author.name)
  end

  def publication_time_frame(author)
    time_frame = Hash.new
    years = author.books.map {|book| book.publication_year.to_i}
    sorted_low_to_high = years.sort
    time_frame[:start] = sorted_low_to_high.first.to_s
    time_frame[:end] = sorted_low_to_high.last.to_s
    time_frame
  end

  def checkout(book)
    if book.nil?
      false
    elsif !book.checked_out?
      book.check_out
    else
      false
    end
  end

  def checked_out_books
    @books.find_all {|book| book.checked_out?}
  end

  def return(book)
    if book.nil?
      false
    elsif book.checked_out?
      book.return
    end
    # Could this be simpler?? Hrmmmm..
    if book.nil?
      false
    elsif !book.checked_out?
      true
    end
  end
end