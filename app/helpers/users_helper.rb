module UsersHelper

	# Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.full_name, class: "gravatar")
  end

  def active_link_text(activatable)  
    activatable.active? ? 'Deactivate' : 'Activate'  
  end

  def active_text(activatable)
    activatable.active? ? 'Active' : 'Inactive'  
  end

  def admin_link_text(adminable)  
    adminable.admin? ? 'Remove Admin' : 'Make Admin'  
  end

  def admin_text(adminable)  
    'Admin' if adminable.admin?
  end
end
