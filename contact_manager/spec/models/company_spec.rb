require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:company) { Company.create(name: 'Acme') }

  it 'is valid' do
    expect(company).to be_valid
  end

  it 'is invalid' do
    company.name = nil
    expect(company).to_not be_valid
  end

  it 'has an array of phone numbers' do
    expect(company.phone_numbers).to eq([])
  end
end
