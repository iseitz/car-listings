require 'rails_helper'

describe Car do
  it { should belong_to :manufacturer }

  it { should have_valid(:name).when("Camry") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_valid(:manufacturer).when(Manufacturer.new) }
  it { should_not have_valid(:manufacturer).when(nil) }

  it { should have_valid(:year).when(2003) }
  it { should_not have_valid(:year).when(nil, "", 1919) }

  it { should have_valid(:color).when("Purple") }
  it { should_not have_valid(:color).when(nil, "") }

  it { should have_valid(:mileage).when(10000) }
  it { should_not have_valid(:mileage).when(nil, "", "fish") }
end
