require 'rails_helper'

describe Manufacturer do
  it { should have_many :cars }

  it { should have_valid(:name).when("Toyota") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_valid(:country).when("Japan") }
  it { should_not have_valid(:country).when(nil, "") }

  subject { FactoryBot.build(:manufacturer) }
  it { should validate_uniqueness_of(:name) }
end
