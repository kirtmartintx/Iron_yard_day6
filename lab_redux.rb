require './shipment'

puts "hai"

payment = 0
leelabonus = 0
leelatrips = 0
frybonus = 0
frytrips = 0
amybonus = 0
amytrips = 0
benderbonus = 0
bendertrips = 0
venustotal = 0
jupitertotal = 0
saturntotal = 0
neptunetotal = 0
plutototal = 0
countearth = 0
countmars = 0
counturanus = 0
leelas_deliveries = 0

open("planet_express_logs").each do |line|

values_array = line.chomp.split(",")

shipment = Shipment.new
shipment.destination = values_array[0]
shipment.item = values_array[1]
shipment.crates = values_array[2].to_i
shipment.payment = values_array[3].to_i
#puts shipment.inspect

payment += shipment.payment

case shipment.destination
when "Earth"
  countearth += shipment.payment
  frybonus += shipment.payment/10
  frytrips += 1
when "Mars"
  countmars += shipment.payment
  amybonus += shipment.payment/10
  amytrips += 1
when "Uranus"
    counturanus += shipment.payment
    benderbonus += shipment.payment/10
    bendertrips += 1
else
  leelas_deliveries = shipment.payment
  leelabonus += shipment.payment/10
  leelatrips += 1
end

case shipment.destination
when "Jupiter"
  jupitertotal += shipment.payment
when "Venus"
    venustotal += shipment.payment
when "Saturn"
      saturntotal += shipment.payment
when "Pluto"
      plutototal += shipment.payment
end
end

p "Payment of #{plutototal} from trips to Earth."
p "Payment of #{saturntotal} from trips to Earth."
p "Payment of #{venustotal} from trips to Earth."
p "Payment of #{neptunetotal} from trips to Earth."
p "Payment of #{jupitertotal} from trips to Earth."
p "Our take for this week is #{payment}."
p "Payment of #{countearth} from trips to Earth."
p "Payment of #{countmars} from trips to Mars."
p "Payment of #{counturanus} from trips to Uranus."
p "Leelas' bonus is #{leelabonus}."
p "Frys' bonus is #{frybonus}."
p "Benders' bonus is #{benderbonus}."
p "Fry made #{frytrips} trips."
p "Amy made #{amytrips} trips."
p "Bender made #{bendertrips} trips."
p "Leela made #{leelatrips} trips."
