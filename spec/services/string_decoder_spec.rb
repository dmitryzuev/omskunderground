require 'rails_helper'

RSpec.describe StringDecoder do
  let(:decoder) { StringDecoder.new }

  it 'decodes numeric string' do
    input = '1231412353'
    expect(decoder.call(input)).to equal(1231412353.0)
  end

  it 'decodes numeric string with spaces' do
    input = '1 412 935 315'
    expect(decoder.call(input)).to equal(1412935315.0)
  end

  it 'decodes numeric string with punctuation' do
    input = '1,426,233,234.43'
    expect(decoder.call(input)).to equal(1426233234.43)
  end

  it 'decodes string with млрд млн тыс' do
    input = '1 млрд 25 млн'
    expect(decoder.call(input)).to equal(1025000000.0)
  end

  it 'decodes string with миллиард миллион тысяча' do
    input = '1 миллиард 149 миллионов 51 тысяча'
    expect(decoder.call(input)).to equal(1149051000.0)
  end

  it 'decodes string with punctuatuin and words' do
    input = '1.44 миллиарда'
    expect(decoder.call(input)).to equal(1440000000.0)
  end
end
