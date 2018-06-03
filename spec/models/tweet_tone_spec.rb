require 'rails_helper'

describe TweetTone do
  describe 'relationships' do
    it { should belong_to :tone }
    it { should belong_to :tweet }
  end
end
