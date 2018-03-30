class TransactionsController < ApplicationController
	
def new
end

#Webhook Url for Paystack after payment to create transaction 

  def success
    if params[:reference].present?

      redirect_to root_path, notice: "Sucessful Payment"
    
    else
    redirect_to new_subscription_path, notice: "Error Making Payment, Try Again"

    end
  end

#End


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

  
end
