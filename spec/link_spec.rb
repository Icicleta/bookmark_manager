require 'spec_helper'

describe Link do
  context 'demonstration of how data mapper works' do
    it 'can be created and then retrieved from db' do
      expect(described_class.count).to eq 0
      described_class.create(title: 'Makers Academy',
                             url:   'http://www.makeracademy.com/')
      expect(described_class.count).to eq 1
      link = described_class.first
      expect(link.url).to eq 'http://www.makeracademy.com/'
      expect(link.title).to eq 'Makers Academy'
      link.destroy
      expect(described_class.count).to eq 0
    end
  end
end
