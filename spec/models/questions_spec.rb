require 'rails_helper'

describe Question do
  it { should validate_presence_of :question1 }
  it { should validate_presence_of :question2 }
  it { should validate_presence_of :question1vote }
  it { should validate_presence_of :question2vote }

end
