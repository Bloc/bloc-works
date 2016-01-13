require "erubis"

module BlocWorks
  class Controller
    def initialize(env)
      @env = env
    end

    def render(view, locals = {})
      filename = File.join("app", "views", "#{view}.html.erb")
      template = File.read(filename)
      eruby = Erubis::Eruby.new(template)
      eruby.result(locals.merge(env: @env))
    end
  end
end
