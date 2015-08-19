require 'spec_helper'

describe Event do 
  it { should validate_presence_of(:day) }
  it { should validate_presence_of(:month) }
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:actor) }
  it { should validate_presence_of(:action) }
end