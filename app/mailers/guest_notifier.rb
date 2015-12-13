class GuestNotifier < ApplicationMailer
	default :from => 'get.dipen@gmail.com'

	def send_reservation_confirmation_email(guest)
		@guest = guest
		mail( :to => @guest.email,
		:subject => 'You have a reservation')
	end
end
