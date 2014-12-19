require_relative '../data/crm'
require 'pp'

def unemployed(records)
  unemployed = []
  records[:people].each do |person|
    if person[:employments].empty?
      person_hsh = {
        :id => person[:id],
        :first_name => person[:first_name],
        :last_name => person[:last_name],
      }
      unemployed << person_hsh
    end
  end
  unemployed
end

pp unemployed(CRM)
