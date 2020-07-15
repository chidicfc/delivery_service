require 'rails_helper'
require 'support/tasks'

describe 'rake billed_orders:shipping' do
  context 'when no argument is given' do
    it 'raises an appropriate error' do
      expect {task.invoke}.to raise_error('Error: task requires a delivery date (dd-mm-yyyy) argument')
    end
  end

  context 'when the argument is in the wrong format' do
    before { task.reenable }

    it 'raises an appropriate error' do
      expect {task.invoke('test')}.to raise_error('Error: delivery date should be in dd-mm-yyyy format')
    end
  end
end
