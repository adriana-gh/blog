module Visible
  extend ActiveSupport::Concern

  included do
    #validates :status, inclusion: {in:['public','private','archived']}
    #tuto validaciu automaticky robi enum
    scope :visible, -> { where(status: 'public') }
    enum status: {public:'public',private:'private',archived:'archived'}, _scopes: false
  end

  def archived?
    status == 'archived'
  end

  def public?
    status == 'public'
  end

  def private?
    status == 'private'
  end

  class_methods do
    def count_visible
      visible.size
      #size mozeme pouzit iba preto ze to davame na visible,
      #inak by to muselo byt count, co je narocnejsi na vypocet
    end
  end
end