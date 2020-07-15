require 'rails_helper'
require 'support/tasks'

describe 'rake billed_orders:shipping' do
  context 'when no argument is given' do
    let(:error_message) { 'Error: task requires a delivery date (dd-mm-yyyy) argument' }

    it 'raises an appropriate error' do
      expect {task.invoke}.to raise_error(error_message)
    end
  end

  context 'when an argument is given' do
    before { task.reenable }

    context 'when the argument is in the wrong format' do
      let(:argument) { ['test', '12/9/2019'].sample }
      let(:error_message) { 'Error: delivery date should be in dd-mm-yyyy format' }

      it 'raises an appropriate error' do
        expect {task.invoke(argument)}.to raise_error(error_message)
      end
    end

    context 'when an invalid date is given' do
      let(:invalid_date) { '42-07-2011' }
      let(:error_message) { "Error: please enter a valid date\n" }

      it 'raises an appropriate error' do
        expect{task.invoke(invalid_date)}.to output(error_message).to_stdout
      end
    end
  end

end
