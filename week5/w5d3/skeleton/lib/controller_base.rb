require 'active_support'
require 'active_support/core_ext'
require 'erb'
require_relative './session'
require 'byebug'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res, params = {})
    @req = req
    @res = res
    @params = params
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response ? true : false
    # return false unless @already_built_response
    # true
  end

  # Set the response status code and header
  def redirect_to(url)
    raise Exception if already_built_response?
    @res.location = url
    @res.status = 302
    @session.store_session(@res)
    @already_built_response = true
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise Exception if already_built_response?
    @res['Content-Type'] = content_type
    @res.write(content)
    @session.store_session(@res)
    @already_built_response = true
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    file_content = File.read("views/#{self.class.to_s.underscore}/#{template_name}.html.erb")
    erb_content = ERB.new(file_content).result(binding)
    render_content(erb_content, 'text/html')
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
    byebug
    Router.send(name, @req.path, self.class, @req.request_method)
    render(name) unless already_built_response?
  end
end
