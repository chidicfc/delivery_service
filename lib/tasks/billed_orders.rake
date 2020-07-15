namespace :billed_orders do
  desc 'it processes orders with a billed state and prepares them for shipping'
  task :shipping, [:delivery_date] => :environment do |_task, args|
    delivery_date = args[:delivery_date]
    abort 'Error: task requires a delivery date (dd-mm-yyyy) argument' if delivery_date.blank?
  end
end
