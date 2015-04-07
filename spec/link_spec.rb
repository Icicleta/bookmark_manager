require 'spec_helper.rb'

describe Link do

  context 'Demonstration of how datamapper works' do

    # This is not a real test, it's simply a demo of how it works
    it 'can be created and then retrieved from the db' do
      # In the beginning our database is empty, so there are no links
      expect(described_class.count).to eq(0)
      # this creates it in the database, so it's stored on the disk
      described_class.create(title: 'Makers Academy',
                             url:   'http://www.makersacademy.com/')
      # We ask the database how many links we have, it should be 1
      expect(described_class.count).to eq(1)
      # Let's get the first (and only) described_class from the database
      link = described_class.first
      # Now it has all properties that it was saved with.
      expect(link.url).to eq('http://www.makersacademy.com/')
      expect(link.title).to eq('Makers Academy')
      # If we want to, we can destroy it
      link.destroy
      # so now we have no links in the database
      expect(described_class.count).to eq(0)
    end
  end
end