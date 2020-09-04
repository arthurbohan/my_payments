class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.create(payment_params)
    @payment.save
  end

  def show
  end

  def index
    @payments = Payment.all.where(user: current_user).sort_by(&:id)
  end

  def edit
  end

  def update
    @payment.update(payment_params)
  end

  def destroy
    @payment.destroy
  end

  private
  def set_payment
    payment = Payment.find(params[:id])
    if payment.user == current_user
      @payment = payment
    else
      redirect_to payments_path, notice: 'Payment not access.'
    end
  end

  def payment_params
    params.require(:quiz).permit(:account_id, :amount_in_cents,
    :currency, :purpose, :created_at, :approved_at, :executed_at,
    :declined_at, :user_id)
  end
end
