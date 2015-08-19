require 'spec_helper'

describe SetDate do 
  it { should validate_presence_of(:day) }
  it { should validate_presence_of(:month) }
  it { should validate_presence_of(:year) }

end