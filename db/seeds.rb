# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

properties = Property.create(
	[
		{ name: 'Hilton Los Angeles Airport', address_line1: '5711 W Century Blvd', city: 'Los Angeles', state: 'CA', zip: '90045', phone: '(310) 410-4000'},
		{ name: 'Americas Best Value Inn Chico', address_line1: '740 Broadway Street', city: 'Chico', state: 'CA', zip: '95926', phone: '(530) 343-3286'}
	]
)

users = User.create(
	[
		{ email: 'a@a.com', password: 'a', password_confirmation: 'a', firstname: "George", lastname: "Silva", property_id: properties[0].id},
		{ email: 'b@b.com', password: 'b', password_confirmation: 'b', firstname: "Melissa", lastname: "Foster", property_id: properties[1].id},
		{ email: 'c@c.com', password: 'c', password_confirmation: 'c', firstname: "Daniel", lastname: "Powell", property_id: properties[0].id},
		{ email: 'd@d.com', password: 'd', password_confirmation: 'd', firstname: "Jessica", lastname: "Walsh"}
	]
)

room_types = RoomType.create(
	[
		{ property_id: properties[0].id, code: "NQ1", name: "Non-Smoking Queen", description: "This is a Non-Smoking room that has a Queen sized bed." },
		{ property_id: properties[0].id, code: "Q1", name: "Smoking Queen", description: "This is a Smoking room that has a Queen sized bed." },
		{ property_id: properties[0].id, code: "NK1", name: "Non-Smoking King", description: "This is a Non-Smoking room that has a King sized bed." },
		{ property_id: properties[0].id, code: "K1", name: "Smoking King", description: "This is a Smoking room that has a King sized bed." },

		{ property_id: properties[1].id, code: "NQ1", name: "Non-Smoking Queen", description: "This is a Non-Smoking room that has a Queen sized bed." },
		{ property_id: properties[1].id, code: "Q1", name: "Smoking Queen", description: "This is a Smoking room that has a Queen sized bed." }
	]
)

rooms = Room.create(
	[
		{ property_id: properties[0].id, room_number: 101, room_type_id: room_types[0].id, status: :clean },
		{ property_id: properties[0].id, room_number: 102, room_type_id: room_types[0].id, status: :clean },
		{ property_id: properties[0].id, room_number: 103, room_type_id: room_types[0].id, status: :clean },
		{ property_id: properties[0].id, room_number: 104, room_type_id: room_types[1].id, status: :clean },
		{ property_id: properties[0].id, room_number: 105, room_type_id: room_types[2].id, status: :clean },
		{ property_id: properties[0].id, room_number: 106, room_type_id: room_types[3].id, status: :clean },

		{ property_id: properties[1].id, room_number: 10, room_type_id: properties[1].room_types.first.id, status: :clean },
		{ property_id: properties[1].id, room_number: 11, room_type_id: properties[1].room_types.last.id, status: :clean }
	]
)

reservations = Reservation.create(
	[
		{ property_id: properties[0].id, arrival_date: Date.today, departure_date: Date.today + 5, adults: 2, children: 0, room_type_id: room_types[0].id, rate: 250 },
		{ property_id: properties[0].id, arrival_date: Date.today, departure_date: Date.tomorrow, adults: 2, children: 0, room_type_id: room_types[0].id, rate: 170, notes: "Will arrive after 10pm" },
		{ property_id: properties[0].id, arrival_date: Date.today, departure_date: Date.today + 8, adults: 2, children: 0, room_type_id: room_types[1].id, rate: 225, notes: "Will arrive after midnight" },
		# Arriving tomorrow
		{ property_id: properties[0].id, arrival_date: Date.today + 1, departure_date: Date.today + 8, adults: 2, children: 0, room_type_id: room_types[1].id, rate: 525, notes: "Will arrive after midnight" },
		{ property_id: properties[0].id, arrival_date: Date.today + 1, departure_date: Date.today + 8, adults: 2, children: 0, room_type_id: room_types[1].id, rate: 465, notes: "Will arrive after midnight" },
		# Arriving day after tomorrow
		{ property_id: properties[0].id, arrival_date: Date.today + 2, departure_date: Date.today + 8, adults: 2, children: 0, room_type_id: room_types[1].id, rate: 465, notes: "Will arrive after midnight" },

		{ property_id: properties[1].id, arrival_date: Date.today, departure_date: Date.today + 6, adults: 2, children: 0, room_type_id: room_types[0].id, rate: 60 },
		{ property_id: properties[1].id, arrival_date: Date.today, departure_date: Date.tomorrow, adults: 2, children: 0, room_type_id: room_types[0].id, rate: 72, notes: "Has a dog" },
		{ property_id: properties[1].id, arrival_date: Date.today, departure_date: Date.today + 3, adults: 2, children: 0, room_type_id: room_types[0].id, rate: 72, notes: "Needs first floor" },
		{ property_id: properties[1].id, arrival_date: Date.today, departure_date: Date.tomorrow, adults: 2, children: 0, room_type_id: room_types[1].id, rate: 97, notes: "May cancel" }
	]
)

guests = Guest.create(
	[
		{ reservation_id: reservations[0].id, first_name: "Doris", last_name: "Chen", phone1: "5309865678"},
		{ reservation_id: reservations[0].id, first_name: "Jerry", last_name: "Morales", phone1: "9165687965"},

		{ reservation_id: reservations[1].id, first_name: "Russel", last_name: "Gilbert", phone1: "4156879455"},

		{ reservation_id: reservations[2].id, first_name: "Joyce", last_name: "Estrada", phone1: "9098746587"}

	]
)