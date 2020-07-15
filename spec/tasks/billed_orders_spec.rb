require 'rails_helper'
require 'support/tasks'

describe 'rake billed_orders:shipping' do
  context 'when no argument is given' do
    it 'raises an appropriate error' do
      expect{task.execute}.to raise_error('Error: task requires a delivery date (dd-mm-yyyy) argument')
    end
  end
end
