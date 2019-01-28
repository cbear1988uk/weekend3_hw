require_relative("../db/sql_runner")

class Customer

attr_accessor :name, :funds
attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name) values
          ($1) RETURNING id"
    values = [@name]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets
    ON tickets.film_id = film.id WHERE customer_id = $1"
    values = [@id]
    film_data = SqlRunner.run(sql, values)
    return film_data.map{|film| Film.new(film)}
  end

  def update
    sql = "UPDATE customers SET (name, funds) = ($1, $2)
          WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM users"
    values = []
    customers = SqlRunner.run(sql, values)
    result = customers.map{|customers| Customer.new(customer)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run(sql, values)
  end

  def buys_ticket(film)
    @funds -= film.price
    update()
  end

  # def check_tickets
  #   sql = "SELECT tickets.* FROM tickets INNER JOIN films
  #         ON films.ticket_id = ticket.id WHERE customer_id = $1"
  #   values = [@id]
  #   ticket_data = SqlRunner.run(sql, values)
  #   return ticket_data.map{|ticket| Ticket.new(ticket)}
  # end

end
