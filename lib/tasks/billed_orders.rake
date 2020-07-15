namespace :billed_orders do
  desc 'it processes orders with a billed state and prepares them for shipping'
  task :shipping, [:delivery_date] => :environment do |_task, args|
    delivery_date = args[:delivery_date]
    abort 'Error: task requires a delivery date (dd-mm-yyyy) argument' if delivery_date.blank?
    abort 'Error: delivery date should be in dd-mm-yyyy format' if !delivery_date.match(/^\d{2}-\d{2}-\d{4}$/)

    parsed_delivery_date = Time.zone.parse(delivery_date)

  rescue ArgumentError
    puts 'Error: please enter a valid date'
  end
end
