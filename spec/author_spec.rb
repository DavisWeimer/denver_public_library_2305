require 'rspec'
require './lib/book'
require './lib/author'

RSpec.describe Author do
  describe 'class' do
    it 'exists' do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      expect(charlotte_bronte).to be_a(Author)
      expect(charlotte_bronte.name).to eq("Charlotte Bronte")
      expect(charlotte_bronte.books).to eq([])
    end
  end

  describe 'writes method' do
    it 'adds book' do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      expect(charlotte_bronte.books).to be_a(Array)
      expect(jane_eyre[0].is_a? Book).to be true
      expect(jane_eyre[0].title).to eq("Jane Eyre")

      villette = charlotte_bronte.write("Villette", "1853")
      expect(villette[1].is_a? Book).to be true
      expect(villette[1].title).to eq("Villette")
    end
  end
end