module ERBMethod
  def erb(template, options = {})
    locals = options.fetch(:locals, {})
    define(locals)
    ERB.new(template).result(binding)
  end

  private

  def define(locals)
    locals.each do |name, value|
      define_singleton_method(name) do
        value
      end
    end
  end
end