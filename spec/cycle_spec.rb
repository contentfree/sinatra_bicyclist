RSpec.describe Sinatra::Bicyclist::Cycle do
  let(:routes) { ['a', 'b'] }
  let(:session) { Hash.new }
  subject(:cycle) { described_class.new(session) }

  it 'cycles page' do
    page = cycle.page(routes)
    expect(page).to eq('a')
  end

  it 'cycles all page' do
    pages = 2.times.map { cycle.page(routes) }
    expect(pages).to eq(['a', 'b'])
  end

  it 'has -1 index' do
    expect(cycle.page_index).to eq(-1)
  end

  context 'cycled page' do
    let!(:page) { cycle.page(routes) }
    before { page }

    it 'changes the index' do
      expect(cycle.page_index).to eq(0)
    end
  end

  context 'looped page' do
    let(:first) { cycle.page(routes) }
    let(:second) { cycle.page(routes) }
    let(:third) { cycle.page(routes) }

    it 'loops index' do
      expect(cycle.page_index).to eq(-1)
      expect(first).to eq('a')
      expect(cycle.page_index).to eq(0)
      expect(second).to eq('b')
      expect(cycle.page_index).to eq(1)
      expect(third).to eq('a')
      expect(cycle.page_index).to eq(0)
    end
  end

end
