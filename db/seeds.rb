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
		{ email: 'a@a.com', password: 'a', password_confirmation: 'a', firstname: "", lastname: "", property_id: properties[0]},
		{ email: 'b@b.com', password: 'b', password_confirmation: 'b', firstname: "", lastname: "", property_id: properties[1]},
		{ email: 'c@c.com', password: 'c', password_confirmation: 'c', firstname: "", lastname: "", property_id: properties[0]}
	]
)

room_types = Room_type.create(
	[
		{ property_id: properties[0], code: "NQ1", name: "Non-Smoking Queen", description: "This is a Non-Smoking room that has a Queen sized bed." }
		{ property_id: properties[0], code: "Q1", name: "Smoking Queen", description: "This is a Smoking room that has a Queen sized bed." }
		{ property_id: properties[0], code: "NK1", name: "Non-Smoking King", description: "This is a Non-Smoking room that has a King sized bed." }
		{ property_id: properties[0], code: "K1", name: "Smoking King", description: "This is a Smoking room that has a King sized bed." }
	]
)


