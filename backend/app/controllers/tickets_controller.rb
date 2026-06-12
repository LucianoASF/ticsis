class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show update destroy ]

  # GET /tickets
  def index
     tickets = Ticket.order(updated_at: :desc).page(params[:page]).per(10).includes(:user)

     render json: { tickets: tickets.as_json(
    include: {
      user: { only: [ :name ] }
    }), current_page: tickets.current_page,
    total_pages: tickets.total_pages,
    total_count: tickets.total_count
    }
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
      render json: { errors: @ticket.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tickets/1
  def update
    if @ticket.update(ticket_update_params)
      render json: @ticket
    else
      render json: { errors: @ticket.errors.full_messages }, status: :unprocessable_entity
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
