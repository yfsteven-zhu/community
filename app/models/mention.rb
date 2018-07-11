class Mention
  attr_reader :mentionable
  include Rails.application.routes.url_helpers



  def self.all(letters)
    return Mention.none unless letters.present?
    # You should bring this user query into your User model as a scope
    users = User.limit(5).where('name like ?',"#{letters}%").compact
    users.map do |user|
      { name: user.name }
    end
  end

  def self.create_from_text(update)
    potential_matches = update.content.scan(/@\w+/i)
    potential_matches.uniq.map do |match|
      mention = Mention.create_from_match(match)
      next unless mention
      update.update_attributes!(content: mention.markdown_string(update.content))
      # You could fire an email to the user here with ActionMailer
      mention
    end.compact
  end


  def self.create_from_match(match)
    user = User.find_by(name: match.delete('@'))
    UserMention.new(user) if user.present?
  end

  def initialize(mentionable)
    @mentionable = mentionable
  end

  class UserMention < Mention
    def markdown_string(text)
      # Don't forget to add your app's host here for production code!
      host = Rails.env.development? ? 'localhost:3000' : ''
      text.gsub(/@#{mentionable.name}/i,
                "[**@#{mentionable.name}**](#{user_url(mentionable, host: host)})")
    end
  end
end