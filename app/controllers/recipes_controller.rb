require 'redcarpet'

class RecipesController < ApplicationController
  def index
    @recipes = recipe_service.all
  end

  def show
    @recipe = recipe_service.find(params[:id])
    @renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
  end

  private

  def recipe_service
    @recipe_service ||= Contentful::Recipes.new
  end
end
