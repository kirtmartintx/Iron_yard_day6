require './shipment'

puts "hai"

money = 0

open("planet_express_logs").each do |line|

values_array = line.chomp.split(",")

shipment = Shipment.new
shipment.destination = values_array[0]
shipment.what_got_shipped = values_array[1]
shipment.how_many = values_array[2].to_i
shipment.money = values_array[3].to_i
puts shipment.inspect

money += shipment.money

end

puts "How much money di we make this week?"
puts "Money: #{money}"
