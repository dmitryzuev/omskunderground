require 'rails_helper'

RSpec.describe Record, type: :model do
  let(:record) { FactoryGirl.build(:record) }
  let(:records) { FactoryGirl.build_list(:record, 25) }

  it 'has a valid factory' do
    expect(record).to be_valid
  end

  it 'has .total_spent scope' do
    records.each(&:save!)
    expect(Record.total_spent).to eq(Record.sum(:sum))
  end

  it 'has .total_undergrounds scope' do
    records.each(&:save!)
    expect(Record.total_undergrounds).to eq(Record.sum(:undergrounds))
  end
end
