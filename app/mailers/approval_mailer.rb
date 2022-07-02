class ApprovalMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.approval_mailer.trader_approved.subject
  #
  def trader_approved
    @receiver = params[:email]
    @greeting = 'Greetings from Wednesday support team!'

    mail to: @receiver, subject: "Trader approval"
  end
end
