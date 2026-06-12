class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show update destroy ]

  # GET /tickets
  def index
    @tickets = Ticket.all

    render json: @tickets
  end

  # GET /tickets/1
  def show
    render json: @ticket
  end

  # POST /tickets
  def create
    @ticket = Ticket.new(ticket_create_params)

    if @ticket.save
      render json: @ticket, status: :created, location: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /tickets/1
  def update
    if @ticket.update(ticket_update_params)
      render json: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_content
    end
  end

  # DELETE /tickets/1
  def destroy
    @ticket.destroy!
  end

  private

    def set_ticket
      @ticket = Ticket.find(params.expect(:id))
    end

    def ticket_create_params
      params.expect(ticket: [ :title, :description, :priority, :user_id ])
    end

    def ticket_update_params
      params.expect(ticket: [ :title, :description, :status, :priority ])
    end
end
