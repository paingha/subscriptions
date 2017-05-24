class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :confirmable, :rememberable, :trackable, :validatable

   after_commit :create_customer, on: :create
 
  def create_customer
    paystackObj = Paystack.new
  	customers = PaystackCustomers.new(paystackObj)
	result = customers.create(
		:first_name => first_name,
		:last_name => last_name,
		:phone => phone,
		:email => email
	)
  end
end
