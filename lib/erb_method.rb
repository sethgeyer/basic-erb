module ERBMethod
  def erb(template, options = {})
    locals = options.fetch(:locals, {})
    layout = options.fetch(:layout, nil)

    define(locals)

    if layout
      render_layout(layout, template)
    else
      render(template)
    end
  end

  def render_layout(layout, template)
    render_with_block(layout) do
      render(template)
    end
  end

  def render(template)
    renderer_for(template).result(binding)
  end

  def render_with_block(template, &block)
    renderer_for(template).result(binding, &block)
  end

  def renderer_for(template)
    ERB.new(template)
  end

  def define(locals)
    locals.each do |name, value|
      define_singleton_method(name) do
        value
      end
    end
  end
end