require "erb_generator"

class HTMLGenerator < ERBGenerator

  def initialize(value = nil)
    @value = value
  end

  def section(text)
    template =  "<section><%=html_text%></section>"


    options_hash = {:locals => {:html_text => text}, :layout => @value}
    erb template, options_hash
  end

  def unordered_list(items)
    template = <<-TEMPLATE
      <ul>
        <%html_items.each do |item| %>
        <li><%=item%></li>
        <%end%>
      </ul>
    TEMPLATE
    options_hash = {:locals => {:html_items => items}, :layout => @value}
    erb template, options_hash
  end

  def button(text, hash = {})
    template = if hash != {}
                 "<button class='<%=classiness%>'><%=btext%></button>"
              else
                "<button><%=btext%></button>"
              end
    options_hash = {:locals => {:btext => text, :classiness => hash[:class]}, :layout => @value}
    erb template, options_hash
  end


end