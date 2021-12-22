# frozen_string_literal: true

def generate_string
  words_list = %w[Dog Sun Minecraft Doom]

  words_list.sample(2).join(' ')
end

def create_files
  file_f = File.open('F.txt', 'w')
  file_g = File.open('G.txt', 'w')
  file_h = File.open('H.txt', 'w')

  file_f.write(generate_string)
  file_g.write(generate_string)
  file_f.close
  file_g.close
  file_h.close
end

def processor
  file_f = File.open('F.txt', 'r')
  file_g = File.open('G.txt', 'r')
  file_h = File.open('H.txt', 'w')

  words_f = file_f.readline.split
  words_g = file_g.readline.split
  result = (words_f & words_g).join(' ')
  file_h.write(result) if result != []

  file_h.close
  file_f.close
  file_g.close
end

def show_files
  file_f = File.open('F.txt', 'r')
  file_g = File.open('G.txt', 'r')
  file_h = File.open('H.txt', 'r')

  puts 'Содержимое файла F:'
  puts file_f.readline
  puts 'Содержимое файла G:'
  puts file_g.readline
  puts 'Содержимое файла H:'
  puts file_h.readline unless File.empty?('H.txt')

  file_f.close
  file_g.close
  file_h.close
end

def delete_files
  File.delete('F.txt')
  File.delete('G.txt')
  File.delete('H.txt')
end

def main
  create_files
  processor
  show_files
  delete_files
end
