@jankens = {g: "グー",c: "チョキ",p: "パー"}
program_hand = @jankens.values.sample
p program_hand

puts "何本勝負？次の中から数字を選んでください。"
puts "(press 1 or 3 or 5)"
num_games = gets.to_i
puts "#{num_games}本勝負を選びました"

win = 0
lose = 0

num_games.times {
  p "じゃん・けん・ぽん！"
  p program_hand
  p "(press g : グー, c : チョキ, p : パー)"
  input_hand = gets.chomp.to_sym

  def player(inp)
    @jankens[inp]
  end
  player(input_hand)
  if program_hand == player(input_hand)
    while program_hand == player(input_hand)
      p "-------------------------------"
      p "私は#{program_hand}"
      p "あなたも#{player(input_hand)}"
      p "-------------------------------"
      p "あいこです！"
      p "-------------------------------"
      p "じゃん・けん・ぽん！"
      p program_hand
      p "(press g : グー, c : チョキ, p : パー)"
      input_hand = gets.chomp.to_sym
    end
  elsif (program_hand == "グー" && player(input_hand) == "パー") ||
          program_hand == "チョキ" && player(input_hand) == "グー" ||
          program_hand == "パー" && player(input_hand) == "チョキ"
    win += 1 
    p "-------------------------------"
    p "私は#{program_hand}"
    p "あなたは#{player(input_hand)}"
    p "-------------------------------"
    p "あなたの勝ちです！"
    p "-------------------------------"
  else
    lose += 1
    p "-------------------------------"
    p "私は#{program_hand}"
    p "あなたは#{player(input_hand)}"
    p "-------------------------------"
    p "あなたの負けです。残念。"
    p "-------------------------------"
  end
  p "#{win}勝#{lose}敗"
}

if win > lose
  p "#{win}勝#{lose}敗であなたの勝ち"
else
  p "#{win}勝#{lose}敗であなたの負け"
end


# input_hand !=(:g && :c && :p)
# p "(press g : グー, c : チョキ, p : パー)"