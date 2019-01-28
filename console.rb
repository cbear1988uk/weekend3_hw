require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

require('pry')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({'name' => 'Collin Bull', 'funds' => '80'})
customer1.save()
customer2 = Customer.new({'name' => 'William Satchell', 'funds' => '65'})
customer2.save()
customer3 = Customer.new({'name' => 'Emily McPherson', 'funds' => '100'})
customer3.save()

film1 = Film.new({'title' => 'Interstellar', 'price' => '10'})
film1.save()
film2 = Film.new({'title' => 'The Great Gatsby', 'price' => '8'})
film2.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})
ticket2.save()
ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film2.id})
ticket3.save()



binding.pry
nil
