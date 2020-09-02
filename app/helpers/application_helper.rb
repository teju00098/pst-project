module ApplicationHelper

  def master_business
    @master_business ||= MasterBusiness.first || MasterBusiness.new
  end
end
