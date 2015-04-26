module Users
  def current_user
    User.first(id: session[:user_id])
  end

  def current_user_has_smiled?(cheep)
    Smile.first(cheep: cheep, user: current_user)
  end

  def smile(cheep)
    if current_user_has_smiled?(cheep)
      'smile'
    else
      'indifferent'
    end
  end
end