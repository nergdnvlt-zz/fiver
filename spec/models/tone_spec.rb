require 'spec_helper'
require './app/models/tone'

describe Tone do
  it 'initializes with hash as attribute' do
    text = {score: '1', tone_name: 'Angry', tone_id: 'angry'}

    tone = Tone.new(text)
    expect(tone.score).to eq(text[:score])
    expect(tone.name).to eq(text[:tone_name])
    expect(tone.id).to eq(text[:tone_id])
  end

  it 'initializes with other attributes' do
    text = {score: '8', tone_name: 'Happy', tone_id: 'happy'}

    tone = Tone.new(text)
    expect(tone.score).to eq(text[:score])
    expect(tone.name).to eq(text[:tone_name])
    expect(tone.id).to eq(text[:tone_id])
  end
end
