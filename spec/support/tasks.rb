# check out https://medium.com/@jelaniwoods/rspec-tests-for-rake-tasks-da7985896014 for a detailed explanation of this setup

require 'rake'
module TaskSupport
  extend ActiveSupport::Concern

  included do
    let(:task_name) { self.class.top_level_description.sub(/^rake\s/, '') }
    let(:tasks) { Rake::Task }

    subject(:task) { tasks[task_name] }
  end
end

RSpec.configure do |config|
  # Tag Rake specs with `:task` metadata or put them in the spec/tasks dir
  config.define_derived_metadata(:file_path => %r{/spec/tasks/}) do |metadata|
    metadata[:type] = :task
  end

  config.include TaskSupport, type: :task

  config.before(:suite) do
    Rails.application.load_tasks
    Rake::Task.define_task(:environment)
  end
end
