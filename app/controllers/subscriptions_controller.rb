class SubscriptionsController < ApplicationController
before_action :authenticate_user!
	
def new
end

  def create
  	paystackObj = Paystack.new
  	transactions = PaystackTransactions.new(paystackObj)
	result = transactions.initializeTransaction(
		:reference => "apeelit",
		:amount => 500000,
		:email => "apeelit@gmail.com",
		)
	auth_url = result['data']['authorization_url']

  	subscriptions = PaystackSubscriptions.new(paystackObj)
	result = subscriptions.create(

				:customer => "apeelit@gmail.com",
				:plan => "PLN_67c5kydt1306owr", #plan id
				:amount => 500000,
			)

  end

  def index
  end

  def edit
  end

  def disable
  	subscriptions = PaystackSubscriptions.new(paystackObj)
	result = subscriptions.disable(
				:code => "12328833",
				:token => "EWFWKFJWE" #user email token
			)
  end
end
