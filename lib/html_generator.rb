require "ostruct"

class HtmlGenerator
  def initialize(template)
    @template = ERB.new(template)
  end

  def template(locals)
    define_locals(locals)
    @template.result(binding)
  end

  private

  def define_locals(locals)
    locals.each do |name, value|
      define_singleton_method(name) do
        value
      end
    end
  end
end