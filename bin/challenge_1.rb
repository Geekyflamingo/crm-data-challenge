require_relative '../data/crm'
require 'pp'

def employees_by_company(records)
  companies = []
  records[:companies].each do |company|
    company_hsh = {:name => company[:name], :employees => []}
    companies << company_hsh
    records[:people].each do |person|
      person[:employments].each do |employment|
        if employment[:company_id] == company[:id]
          employee_hsh = {
            :id => person[:id],
            :first_name => person[:first_name],
            :last_name => person[:last_name],
            :title => employment[:title]
          }
          company_hsh[:employees] << employee_hsh
        end
      end
    end
  end
   companies
end

pp employees_by_company(CRM)
