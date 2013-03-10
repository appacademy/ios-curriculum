class ApnsToken < ActiveRecord::Base
  validates_presence_of :token

  def send_notification(hash)
    APNS.send_notification(self.token,
      :aps => {
        :alert => hash[:alert],
        :badge => hash[:badge] || 0,
        :sound => hash[:sound] || "default"
        },
      :more_data => hash[:more_data]
    )
  end
end
