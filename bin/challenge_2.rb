require_relative '../data/crm'
require 'pp'

def employments(records)
  employments = []
  records[:people].each do |person|
    unless person[:employments].empty?
      person[:employments].each do |employment|
        employment_hsh = {
          :company_id => employment[:company_id],
          :company_name => "",
          :person_id => person[:id],
          :person_first_name => person[:first_name],
          :person_last_name => person[:last_name],
          :title => employment[:title]
        }
        records[:companies].each do |company|
          if company[:id] = employment[:company_id]
            employment_hsh.merge!(:company_name => company[:name])
          end
        end
        employments << employment_hsh
      end
    end
  end
  employments
end
