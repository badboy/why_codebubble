#!/usr/bin/env ruby
# encoding: utf-8

require 'coderay'
require 'sinatra/base'
require 'mustache/sinatra'

class CodeBubble < Sinatra::Base
  require_relative 'views/layout'

  register Mustache::Sinatra

  set :public_dir, "./public"
  enable :static

  set :mustache, {
    :views => './views/',
    :templates => './templates/'
  }

  get '/' do
    @code_raw = open(__FILE__).read
    @lang = 'ruby'
    @code = CodeRay.scan(@code_raw, @lang).div
    @posted = true
    mustache :index
  end

  post '/' do
    @code_raw = params[:code]
    @lang = params[:lang] || 'ruby'

    if @code_raw && @code_raw.length > 0
      @code = CodeRay.scan(@code_raw, @lang).div
      @posted = true
    end
    mustache :index
  end
end
