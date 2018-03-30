class TransactionsController < ApplicationController
	
def new
end

  def create

  	paystackObj = Paystack.new(ENV['PAYSTACK_PUBLIC_KEY'], ENV['PAYSTACK_PRIVATE_KEY'])
  	transactions = PaystackTransactions.new(paystackObj)
	result = transactions.initializeTransaction(
		:reference => "apeeliggffhhhffjjhhhhhhht", #must be unique for every transaction created if not you will get a bad request error
		:amount => 500000,
		:email => "test@gmail.com",
		)
	auth_url = result['data']['authorization_url']
	redirect_to auth_url

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
