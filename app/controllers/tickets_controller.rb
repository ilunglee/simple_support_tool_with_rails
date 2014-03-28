class TicketsController < ApplicationController

  before_action :find_ticket, only: [:show, :edit, :update, :destroy, :done]

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_attributes)
    if @ticket.save
      redirect_to tickets_path
    else
      flash.now[:error] = "You must correct the hightlighted fields"
      render :new
    end


  end

  def search
    search_condition = "%" + params[:term] + "%"
    @tickets = Ticket.where(["name like? OR description like? OR email like?", search_condition, search_condition, search_condition ])
    render :index
  end

  def show
  end

  def edit
  end

  def update
    if @ticket.update_attributes(ticket_attributes)
      redirect_to tickets_path, notice: "ticket updated successfully" 
    else
      flash.now[:error] = "couldn't update the ticket"
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  def done
    if @ticket.status
      @ticket.update_attribute(:status, false)
    else
      @ticket.update_attribute(:status, true)
    end
    # if @ticket.save
    # else
    #   flash.now[:error] = "There is something wrong"
    # end
    redirect_to tickets_path
  end


  private

  def ticket_attributes
    params.require(:ticket).permit([:name,:department, :description, :email ])
  end

  def find_ticket
    @ticket = Ticket.find params[:id]
  end

end
