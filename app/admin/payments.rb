ActiveAdmin.register Payment do
  permit_params :amount_in_cents, :currency, :purpose, :approved_at,
  :executed_at, :declined_at, :user_id

  form do |f|
    inputs "Details" do
      input :user
      input :amount_in_cents
      input :currency
      input :purpose
    end
    actions
  end

  action_item :approve, only: :show do
    if current_admin_user != payment.owner
      link_to "Approve", approved_admin_payment_path(payment),
      method: :put if !payment.approved_at?
    end
  end

  action_item :executed, only: :show do
    link_to "Execute", executed_admin_payment_path(payment),
     method: :put if !payment.executed_at?
  end

  action_item :declined, only: :show do
    link_to "Decline", declined_admin_payment_path(payment),
     method: :put if !payment.declined_at?
  end

  member_action :approved, method: :put do
    payment = Payment.find(params[:id])
    payment.update(approved_at: Time.zone.now)
    redirect_to admin_payment_path(payment)
  end

  member_action :executed, method: :put do
    payment = Payment.find(params[:id])
    payment.update(executed_at: Time.zone.now)
    redirect_to admin_payment_path(payment)
  end

  member_action :declined, method: :put do
    payment = Payment.find(params[:id])
    payment.update(declined_at: Time.zone.now)
    redirect_to admin_payment_path(payment)
  end
end
