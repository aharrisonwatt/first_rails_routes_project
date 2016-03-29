class ContactsController < ApplicationController
  def index
    render json: Contact.all
  end

  def create
    contact = Contact.new(contact_params)

    if contact.save
      render json: contact
    else
      render(
       json: contact.errors.full_messages,
       status: :unprocessable_entity
       )
    end
  end

  def show
    contact = Contact.find_by(:id params[:id])
    render json: contact
    :unprocessable_entity
  end

  def destroy
    contact = Contact.find_by(:id params[:id])
    if contact.delete
      render json: contact
    else
      :unprocessable_entity
    end
  end

  def update
    contact = Contact.find_by(:id, params[:id])
    if contact.update(contact_params)
      render json: contact
    else
      render(
        json: contact.errors.full_messages,
        status: :unprocessable_entity
      )
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
