require 'rspec'
require 'rspec/autorun'
require_relative '../bin/challenge_1'
require_relative '../bin/challenge_2'
require_relative '../bin/challenge_3'

RSpec.describe '#employees_by_company' do
  it 'returns an array of hashes containing the company and all its employees' do
    input = {
      :people => [
        {
          :id => 20,
          :first_name => "Frodo",
          :last_name => "Baggins",
          :employments => [
            {
              :company_id => 0,
              :title => "Chief Person Ring Holder"
            }
          ]
        },
        {
          :id => 32,
          :first_name => "Gandalf",
          :last_name => "The Grey",
          :employments =>
          [
            {
              :company_id => 0,
              :title => "Chief Communications Consultant"
            }
          ]
        }
      ],
      :companies => [
        {
          :id => 0,
          :name => "The Fellowship"
        },
      ]
    }
    expect(employees_by_company(input)).to eq(
    [
      {
        name: "The Fellowship",
        employees: [
          {
            :id => 20,
            :first_name => "Frodo",
            :last_name => "Baggins",
            :title => "Chief Person Ring Holder"
          },
          {
            :id => 32,
            :first_name => "Gandalf",
            :last_name => "The Grey",
            :title => "Chief Communications Consultant"
          },
        ]
      }
    ]
    )
  end
end

RSpec.describe '#employments' do
  it 'returns an array of hashes containing all employment data' do
    input = {
      :people => [
        {
          :id => 20,
          :first_name => "Frodo",
          :last_name => "Baggins",
          :employments => [
            {
              :company_id => 0,
              :title => "Chief Person Ring Holder"
            }
          ]
        },
        {
          :id => 32,
          :first_name => "Gandalf",
          :last_name => "The Grey",
          :employments =>
          [
            {
              :company_id => 0,
              :title => "Chief Communications Consultant"
            }
          ]
        }
      ],
      :companies => [
        {
          :id => 0,
          :name => "The Fellowship"
        },
      ]
    }
    expect(employments(input)).to eq(
    [
      {
        :company_id => 0,
        :company_name => "The Fellowship",
        :person_id => 20,
        :person_first_name => "Frodo",
        :person_last_name => "Baggins",
        :title => "Chief Person Ring Holder"
      },
      {
        :company_id => 0,
        :company_name => "The Fellowship",
        :person_id => 32,
        :person_first_name => "Gandalf",
        :person_last_name => "The Grey",
        :title => "Chief Communications Consultant"
      },
    ]
    )
  end
end

RSpec.describe '#unemployed' do
  it 'returns an array of hashes containing all employment data' do
    input = {
      :people => [
        {
          :id => 20,
          :first_name => "Frodo",
          :last_name => "Baggins",
          :employments => []
        },
        {
          :id => 32,
          :first_name => "Gandalf",
          :last_name => "The Grey",
          :employments => []
        }
      ],
      :companies => [
        {
          :id => 0,
          :name => "The Fellowship"
        },
      ]
    }
    expect(unemployed(input)).to eq(
    [
      {
        :id => 20,
        :first_name => "Frodo",
        :last_name => "Baggins"
      },
      {
        :id => 32,
        :first_name => "Gandalf",
        :last_name => "The Grey",
      }
    ]
    )
  end
end
