# Convert human entered string into number
class StringDecoder
  POWERS = {
    'трлн' => 10**12,
    'триллион' => 10**12,
    'триллиона' => 10**12,
    'триллионов' => 10**12,
    'млрд' => 10**9,
    'миллиард' => 10**9,
    'миллиарда' => 10**9,
    'миллиардов' => 10**9,
    'млн' => 10**6,
    'миллион' => 10**6,
    'миллиона' => 10**6,
    'миллионов' => 10**6,
    'т' => 10**3,
    'тыс' => 10**3,
    'тысяча' => 10**3,
    'тысячи' => 10**3,
    'тысяч' => 10**3
  }.freeze

  def call(input)
    input = comma_to_dot(input.mb_chars.downcase.to_s)

    return input.gsub(/[\s,]/, '').to_f if float? input.gsub(/[\s,]/, '')

    result = 0
    input.gsub(/(?<=[\d])(?=[а-яА-Я])/, ' ')
         .split(' ')
         .map { |i| POWERS[i] ? POWERS[i].to_f : i.to_f }
         .each_slice(2) do |slice|
      result += slice.inject(:*)
    end
    result
  end

  private

  def float?(input)
    input[/\A[\d]+[\.]?[\d]*\z/] == input
  end

  # Change all commas to dots, remove all except last one
  # It used to make sure '1,231.41', '1231.41' & '1231,41' are the same
  def comma_to_dot(input)
    return input if !input.include?('.') && !input.include?(',')
    return input.delete(',') if input.include?(',') && !input.include?('.')

    dots = input.tr(',', '.').split('.')
    "#{dots[0..-2].join}.#{dots[-1]}"
  end
end
