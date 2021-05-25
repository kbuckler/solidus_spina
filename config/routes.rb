# frozen_string_literal: true

Spree::Core::Engine.routes.draw do
  mount Spina::Engine => '/cms'  # Add your extension routes here
end
