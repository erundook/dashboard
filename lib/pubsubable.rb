module Pubsubable
  def pubsubable(pubsub_channel='dashboard')
    class_attribute :pubsub_channel
    self.pubsub_channel = pubsub_channel

    class_eval do
      after_create :pubsub_trigger_create
      after_update :pubsub_trigger_update
      before_destroy :pubsub_trigger_destroy

      def self.pubsubable?
        true
      end

      private

      def underscored_class_name
        self.class.name.underscore
      end

      def pubsub_trigger_create
        Pusher.trigger(pubsub_channel.to_s, "#{underscored_class_name}.create", { model_id: self.id })
      end

      def pubsub_trigger_update
        Pusher.trigger(pubsub_channel.to_s, "#{underscored_class_name}.update", { model_id: self.id })
      end

      def pubsub_trigger_destroy
        Pusher.trigger(pubsub_channel.to_s, "#{underscored_class_name}.destroy", { model_id: self.id })
      end
    end
  end
end

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Pubsubable
end
