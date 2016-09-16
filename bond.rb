# frozen_string_literal: true
require 'csv'

# TODO: Add documentation
# Missing top-level module documentation comment
class Bond
  attr_accessor :sample_data
  FILE_PATH = File.expand_path('../data/sample_input.csv', __FILE__)

  def initialize
    @sample_data = load_file(FILE_PATH)
  end

  def output
    p 'CHALLENGE 1'
    p 'Single yield spread calculation:'
    caulate_gov_bond_benchmark


    puts "\n\n"

    p 'CHALLENGE 2'
    p 'Spread to curve calculation for given corporate bond:'
    caulate_spread_gov_bond_curve
  end

  def caulate_gov_bond_benchmark
    collect = []

    @sample_data.each do |data|
      if data[1] == 'corporate'
        collect << data[0]
        collect << gov_bond_benchmark(data[2].split(' ')[0].to_f, data[3].to_f)
      end
    end

    collect.each_slice(2) { |x| p x.join(',') }
    result = collect
  end

  def caulate_spread_gov_bond_curve
    collect = []

    @sample_data.each do |data|
      if data[1] == 'corporate'
        collect << data[0]
        collect << "#{spread_gov_bond_curve(data[2].split(' ')[0].to_f, data[3].to_f)}%"
      end
    end

    collect.each_slice(2) { |x| p x.join(',') }
    result = collect
  end

  private

  def gov_bond_benchmark(data_term, data_yield)
    x_first = prepare_term_data.sort.min_by { |x| (x.to_f - data_term).abs }
    y_first = prepare_yield_data.at(prepare_term_data.index(x_first))
    y_code = prepare_gov_bond_code.at(prepare_term_data.index(x_first))

    "#{y_code},#{(data_yield - y_first).round(3)}%"
  end

  def spread_gov_bond_curve(data_term, data_yield)
    x1 = prepare_term_data.sort.min_by { |x| (x.to_f - data_term).abs }
    x2 = (prepare_term_data - [x1]).sort.min_by { |x| (x.to_f - data_term).abs }

    x_first = [x1, x2].min
    x_second = [x1, x2].max
    y_first = prepare_yield_data.at(prepare_term_data.index(x_first))
    y_second = prepare_yield_data.at(prepare_term_data.index(x_second))

    (data_yield - (y_first + (y_second - y_first) * (data_term - x_first) / (x_second - x_first))).round(2)
  end

  def prepare_term_data
    result = []

    sample_data.each do |data|
      result << data[2].split(' ')[0].to_f if data[1] == 'government'
    end

    result
  end

  def prepare_yield_data
    result = []

    sample_data.each do |data|
      result << data[3].to_f if data[1] == 'government'
    end

    result
  end

  def prepare_gov_bond_code
    result = []

    sample_data.each do |data|
      result << data[0] if data[1] == 'government'
    end

    result
  end

  def load_file(_path)
    CSV.read(FILE_PATH)
  end
end
