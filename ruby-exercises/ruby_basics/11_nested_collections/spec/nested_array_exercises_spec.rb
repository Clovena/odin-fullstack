require 'spec_helper'
require_relative '../exercises/nested_array_exercises'

RSpec.describe 'Nested Array Exercises' do
  describe 'blank seating chart creation exercise' do
    it 'returns a 2d array (chart) containing 2 rows, each containing nil 3 times' do
      expected_output = [[nil, nil, nil], [nil, nil, nil]]
      expect(blank_seating_chart(2, 3)).to eq(expected_output)
    end

    xit 'returns a 2d array (chart) containing 4 arrays, each containing nil 2 times' do
      expected_output = [[nil, nil], [nil, nil], [nil, nil], [nil, nil]]
      expect(blank_seating_chart(4, 2)).to eq(expected_output)
    end

    context 'when one of the rows are changed' do
      xit "doesn't change the other rows" do
        my_array = blank_seating_chart(4, 2)
        my_array[2][1] = true

        expect(my_array).to eq([[nil, nil], [nil, nil], [nil, true], [nil, nil]])
      end
    end
  end

  describe 'add seat to row exercise' do
    let(:array) { [[nil, 'Bob', 'Joe'], [nil, nil, 'Bill']] }

    xit "returns the array with 'Jack' added to the end of the second row" do
      expected_output = [[nil, 'Bob', 'Joe'], [nil, nil, 'Bill', 'Jack']]
      expect(add_seat_to_row(array, 1, 'Jack')).to eq(expected_output)
    end

    xit "returns the array with 'Diane' added to the end of the first row" do
      expected_output = [[nil, 'Bob', 'Joe', 'Diane'], [nil, nil, 'Bill']]
      expect(add_seat_to_row(array, 0, 'Diane')).to eq(expected_output)
    end
  end

  describe 'add another row exercise' do
    let(:array) { [[nil, 'Bob', 'Joe'], [nil, nil, 'Bill']] }

    xit "returns the array with ['Bo', nil, 'Kim'] added as a third row" do
      expected_output = [[nil, 'Bob', 'Joe'], [nil, nil, 'Bill'], ['Bo', nil, 'Kim']]
      expect(add_another_row(array, ['Bo', nil, 'Kim'])).to eq(expected_output)
    end

    xit "returns the array with ['Tim', 'Joe', nil] added as a third row" do
      expected_output = [[nil, 'Bob', 'Joe'], [nil, nil, 'Bill'], ['Tim', 'Joe', nil]]
      expect(add_another_row(array, ['Tim', 'Joe', nil])).to eq(expected_output)
    end
  end

  describe 'delete seat from grid exercise' do
    let(:array) { [[nil, 'Bob', 'Joe'], [nil, nil, 'Bill']] }

    xit 'returns the array with the second item in the first row deleted' do
      expected_output = [[nil, 'Joe'], [nil, nil, 'Bill']]
      expect(delete_seat_from_row(array, 0, 1)).to eq(expected_output)
    end

    xit 'returns the array with the first item in the second row deleted' do
      expected_output = [[nil, 'Bob', 'Joe'], [nil, 'Bill']]
      expect(delete_seat_from_row(array, 1, 0)).to eq(expected_output)
    end
  end

  describe 'delete row from chart exercise' do
    let(:array) { [[nil, 'Bob'], ['Joe', nil], [nil, 'Bill']] }

    xit 'returns the array with the second row deleted' do
      expected_output = [[nil, 'Bob'], [nil, 'Bill']]
      expect(delete_row_from_chart(array, 1)).to eq(expected_output)
    end

    xit 'returns the array with the first row deleted' do
      expected_output = [['Joe', nil], [nil, 'Bill']] 
      expect(delete_row_from_chart(array, 0)).to eq(expected_output)
    end
  end

  describe 'count empty seats exercise' do
    let(:array) { [[nil, 'Bob', 'Joe'], [nil, nil, 'Bill']] }

    context "when there are three nil's in the given array" do
      xit 'returns the number 3' do
        expect(count_empty_seats(array)).to eq(3)
      end
    end

    context "when there are four nil's in the given array" do
      let(:array) { [[nil, 'Bob', nil], [nil, nil, 'Bill']] }

      xit 'returns the number 4' do
        expect(count_empty_seats(array)).to eq(4)
      end
    end

    xit 'does not mutate the original array' do
      count_empty_seats(array)
      expect(array).to eq([[nil, 'Bob', 'Joe'], [nil, nil, 'Bill']])
    end
  end

  describe 'iterate over array of hashes exercise' do
    let(:array) do
      [
        {
          name: 'Ruby',
          facts: ['was made for programmer happiness', 'its code is beautiful'],
          initial_release: 'December 25, 1996',
          is_my_favorite: true
        },
        {
          name: 'Javascript',
          facts: ['you have to use semicolons everywhere', "its real name isn't even javascript"],
          initial_release: 'December 4, 1995',
          is_my_favorite: false
        }
      ]
    end

    xit 'returns an array with the value associated with the name key from each hash object' do
      expected_output = %w[Ruby Javascript]
      expect(iterate_over_array_of_hashes(array, :name)).to eq(expected_output)
    end

    xit 'returns an array with the value associated with the facts key from each hash object' do
      expected_output = [
        ['was made for programmer happiness', 'its code is beautiful'],
        ['you have to use semicolons everywhere', "its real name isn't even javascript"]
      ]
      expect(iterate_over_array_of_hashes(array, :facts)).to eq(expected_output)
    end
  end
end
