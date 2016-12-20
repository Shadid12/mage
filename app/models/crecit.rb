class Crecit < ApplicationRecord
    belongs_to :cleaner, :foreign_key => :cleaner_id, class_name: 'User'
    belongs_to :host, :foreign_key => :host_id, class_name: 'User'
    has_many :messages
end
