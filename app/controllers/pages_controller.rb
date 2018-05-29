class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @themes = policy_scope(Theme).sort_by { |theme| theme.deadline }
    @pending_themes = @themes.select { |theme| !deadline_is_passed?(theme) }
  end

  def index
  end

private

  def deadline_is_passed?(theme)
    theme.deadline.past?
  end

end
