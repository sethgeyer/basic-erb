module ERBMethod
  def erb(template, options = {})
    locals = options.fetch(:locals, {})
    layout = options.fetch(:layout, nil)

    define(locals)

    if layout
      render_layout(layout) do
        render_template(template)
      end
    else
      render_template(template)
    end
  end

  def render_layout(layout, &block)
    ERB.new(layout).result(binding, &block)
  end

  def render_template(template)
    ERB.new(template).result(binding)
  end

  def yield
    render(template)
  end

  def define(locals)
    locals.each do |name, value|
      define_singleton_method(name) do
        value
      end
    end
  end
end