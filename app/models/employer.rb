class Employer < User

  field :name, type: String
  field :address, type: String
  field :phone, type: String

  before_validation :format

  validates :name, presence: true, uniqueness: true

  private
  def format
    self.name = self.name.upcase
    self.email = self.email.downcase
  end
end