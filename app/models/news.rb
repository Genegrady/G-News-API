class News < ApplicationRecord
    belongs_to :user, optional: false
end
