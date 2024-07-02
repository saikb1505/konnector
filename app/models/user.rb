class User < ApplicationRecord
  scope :by_campaign_names, ->(campaign_names) {
    where("campaigns_list @> ?", campaign_names.map { |name| { "campaign_name" => name } }.to_json)
  }

  def self.with_campaign_names(campaign_names)
    conditions = campaign_names.map do |name|
      "JSON_CONTAINS(campaigns_list, ?, '$')"
    end.join(' OR ')

    values = campaign_names.map { |name| { "campaign_name" => name }.to_json }

    where(conditions, *values)
  end
end
