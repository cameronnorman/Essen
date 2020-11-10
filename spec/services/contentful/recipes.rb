require "rails_helper"

RSpec.describe Contentful::Recipes do
  let(:recipes) do
    [
      double(:recipe, id: "abc", title: "Chicken Mayo Sandwich", description: "Really yummy"),
      double(:recipe, id: "def", title: "Green salad", description: "super fresh"),
    ]
  end

  before do
    allow_any_instance_of(Contentful::Client).to receive(:entries).with({content_type: 'recipe'}).and_return(recipes)
    allow_any_instance_of(Contentful::Client).to receive(:entry).with("abc").and_return(recipes.first)
  end

  subject { described_class.new }

  describe "#all" do
    it "returns all the records from contentful" do
      expect(subject.all).to eq(recipes)
    end
  end

  describe "#find" do
    it "returns all the records from contentful" do
      expect(subject.find("abc")).to eq(recipes.first)
    end
  end
end
