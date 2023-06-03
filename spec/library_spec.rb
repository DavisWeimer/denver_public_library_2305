require 'rspec'
require './lib/library'
require './lib/author'
require './lib/book'

RSpec.describe Library do
  describe 'class' do
    it 'exists' do
      dpl = Library.new("Denver Public Library")
      expect(dpl.is_a? Library).to be true
      expect(dpl.name).to eq("Denver Public Library")
      expect(dpl.books).to eq([])
      expect(dpl.authors).to eq([])
    end
  end

  describe 'catalog includes' do
    it 'Charlotte Bronte & Harper Lees works are available at the DPL Library' do
      dpl = Library.new("Denver Public Library")

      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")

      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

      expect(charlotte_bronte.books[2].title).to eq("Villette")
      expect(harper_lee.books[0].title).to eq("To Kill a Mockingbird")

      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)

      expect(dpl.authors).to eq([charlotte_bronte.name, harper_lee.name])
      expect(dpl.books).to eq(dpl.books[0..3])
    end
  end

  describe '#publication_time_frame(author)' do
    it 'can display a timeframe of authors by year' do
      dpl = Library.new("Denver Public Library")
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})

      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)
      
      expect(dpl.publication_time_frame(charlotte_bronte)).to eq({:start=>"1847",:end=>"1857"})
    end
  end

  describe 'iteration 3' do
    it 'can do all the things!' do
      dpl = Library.new("Denver Public Library")
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})

      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)

      expect(dpl.checkout(dpl.book("The Professor"))).to eq true
      expect(dpl.checkout(dpl.book("The Professor"))).to eq false
      expect(dpl.checkout(dpl.book("Ruby 101"))).to eq false
      
      expect(dpl.checkout(dpl.book("Villette"))).to eq true
      expect(dpl.checkout(dpl.book("To Kill a Mockingbird"))).to eq true

      expect(dpl.checked_out_books).to eq([dpl.book("The Professor"), dpl.book("Villette"), dpl.book("To Kill a Mockingbird")])
      
      expect(dpl.return(dpl.book("The Professor"))).to eq true
      expect(dpl.return(dpl.book("Ruby 101"))).to eq false
    end
  end
end