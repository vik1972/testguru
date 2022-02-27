module ApplicationHelper 

    ALERTS = {
      notice: "info",
      error: "danger",
      success: "success",
      alert: "warning"
    }
  
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'Проект githab', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_alert(flash)
    ALERTS[flash.to_sym] if flash[flash]
  end
end

