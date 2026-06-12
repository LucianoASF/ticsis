class DashboardController < ApplicationController
  def index
    render json: {
      status_count: Ticket.group(:status).count,
      latest_tickets: Ticket.includes(:user)
                        .order(created_at: :desc)
                        .limit(5)
                        .as_json(include: { user: { only: :name } }),
      top_users: User
        .select("users.*, COUNT(tickets.id) as tickets_count")
        .joins(:tickets)
        .group("users.id")
        .order("tickets_count DESC")
        .limit(5)
    }
  end
end
