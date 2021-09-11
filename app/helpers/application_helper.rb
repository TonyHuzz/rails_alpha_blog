module ApplicationHelper

  def gravatar_for(user, options = { size: 80 })
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "rounded mx-auto d-block")
  end

  def current_user #登入時利用session去找該使用者
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  #如果已經找過一次使用者的話，就會儲存在＠current_user，而不會每次呼叫這個方法都執行一次sql
  end

  def logged_in?  #判斷是否登入
    !!current_user   # !!可以使回傳值變成Boolean  => True、False
  end

end
