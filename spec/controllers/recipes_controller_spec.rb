require "rails_helper"

RSpec.describe RecipesController do
  let(:recipes) do
    [
      double(:recipe, id: "abc", title: "Chicken Mayo Sandwich", description: "Really yummy"),
      double(:recipe, id: "def", title: "Green salad", description: "super fresh"),
    ]
  end

  before do
    allow_any_instance_of(Contentful::Recipes).to receive(:all).and_return(recipes)
    allow_any_instance_of(Contentful::Recipes).to receive(:find).with("abc").and_return(recipes.first)
  end

  describe "GET index" do
    it "assigns @recipes" do
      get :index
      expect(assigns(:recipes)).to eq(recipes)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "assigns @recipe" do
      get :show, params: {id: "abc"}
      expect(assigns(:recipe)).to eq(recipes.first)
    end

    it "renders the index template" do
      get :show, params: {id: "abc"}
      expect(response).to render_template("show")
    end
  end
end
