require 'securerandom'

class RaffleBot < SlackbotFrd::Bot
  def add_callbacks(slack_connection)
    slack_connection.on_message do |user, channel, message|
      if message =~ /^rafflebot/i
        users = slack_connection.users_in_channel(channel)
        winner = users[SecureRandom.random_number(users.length)]
        slack_connection.send_message(
          channel: channel,
          message: "@#{winner} wins!!!",
          username: "Raffle Bot",
          emoji: ":raphael:"
        )
      end
    end
  end
end
