class ContactsController < ApplicationController


  # GET /contacts
  def index
    @contacts = Contact.all
    json_response(@contacts)
  end

  # POST /contacts
  def create
    @contact = Contact.create(contact_params)
    json_response(@contact, :created)
  end

  # GET /contacts/:id
  def show
    @contact = Contact.find(params[:id])
    json_response(@contact)
  end

  # PUT /contacts/:id
  def update
    @contact = Contact.find(params[:id])
    @contact.update(contact_params)
    head :no_content
  end

  # DELETE /contacts/:id
  def destroy
    @contact = Contact.find(params[:id])
    if @contact.present?
      @contact.destroy
    end

    head :no_content
  end

  private

  def contact_params
    # whitelist params
    params.permit(:name, :number)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end


end
