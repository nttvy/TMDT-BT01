class Blog < ApplicationRecord
    after_initialize :set_defaults, unless: :persisted?
    has_many :comments

    def set_defaults
        self.nb_view  ||= 0
    end
end
