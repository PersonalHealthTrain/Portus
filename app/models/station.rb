# == Schema Information
#
# Table name: stations
#
#  id           :integer          not null, primary key
#  station_id   :integer          not null
#  display_name :text(65535)
#  active       :boolean          default(FALSE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Station < ActiveRecord::Base
  include PublicActivity::Common
  include SearchCop
  include ::Activity::Fallback

end
