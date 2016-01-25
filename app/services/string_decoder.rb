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
end
