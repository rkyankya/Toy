# frozen_string_literal: true

module UsersHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = user.gravatar
    image_tag(gravatar_url, alt: user.username, class: 'gravatar')
  end
end
