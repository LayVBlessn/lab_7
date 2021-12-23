# frozen_string_literal: true

require 'rspec'
require_relative 'main'

describe 'main' do
  before do
    create_files
  end

  after do
    delete_files
  end

  it 'should create 3 files & 2 of them should be filled with 2 words' do
    expect(File.exist?('F.txt')).to eq(true)
    expect(File.exist?('G.txt')).to eq(true)
    expect(File.exist?('H.txt')).to eq(true)
    expect(File.empty?('H.txt')).to eq(true)
    file_f = File.open('F.txt')
    file_g = File.open('G.txt')
    expect(file_f.readline.split.length).to eq(2)
    expect(file_g.readline.split.length).to eq(2)
    file_f.close
    file_g.close
  end

  it 'should return same words from files F & G' do
    processor
    file_f = File.open('F.txt')
    file_g = File.open('G.txt')
    file_h = File.open('H.txt')
    expect(file_f.readline.split & file_g.readline.split).to eq(file_h.readline.split) unless File.empty?('H.txt')

    file_f.close
    file_g.close
    file_h.close
  end
end
