require "csv"
 
puts "1(新規でメモを作成) 2(既存のメモ編集する)"
 
memo_type = gets.chomp.to_s

if memo_type === "1"
  p "拡張子を除いたファイル名を入力してください(CSVファイルのみ対応）"
  file_name = gets.chomp
  p "メモの内容を入力してください"
  p "メモは複数行記入出来ます"
  p "記入を完了する時は　control　+　d　を押してください"
  CSV.open("#{file_name}.csv",'w') do |text|
    text_content = $stdin.read
    text << ["#{text_content}"]
  end
  
elsif memo_type === "2"
  p "編集したいcsvファイル名を入力してください（拡張子は除く）"
  edit_file_name = gets.chomp
  
  if File.exist?("#{edit_file_name}.csv")
    p "現在のメモ内容"
    CSV.foreach("#{edit_file_name}.csv") do |row|
      p row
    end
    
    p "編集してください（元々のメモは破棄されます）"
    p "メモは複数行記入出来ます"
    p "記入を完了する時は　control　+　d　を押してください"
    CSV.open("#{edit_file_name}.csv",'w') do |text|
      text_content = $stdin.read
      text << ["#{text_content}"]
    end
    
  elsif 
    p "ファイルが存在しないか、フォルダ名で検索されています"
  end
  
　else memo_type != "1" && "2"
  p "1か2を入力してください"
  
end
  
  
  