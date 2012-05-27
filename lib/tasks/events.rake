namespace :events do
  desc "Dump all events data as yml"
  task :dump => :environment do
    Event.order(:serial).each do |event|
      puts "%s:"               % event.serial
      %w(name description url turnout place address date).each do |column|
        puts "  %s: %s" % [column, event.send(column).try { |value| value.to_s.gsub("\r\n", "") }]
      end
    end
  end
end
