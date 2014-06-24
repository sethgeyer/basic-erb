require "spec_helper"

class TestERBMethod
  include ERBMethod
end

describe TestERBMethod do
  describe "#template" do
    it "produces a template with a single local" do
      options = {
        :locals => {
          :name => "some name"
        }
      }
      template = "<%= name %>"
      html = TestERBMethod.new.erb(template, options)

      expect(html).to eq("some name")
    end

    it "produces html with multiple variables" do
      options = {
        :locals => {
          :title => "this is a title",
          :items => ["Item 1", "Item 2"]
        }
      }

      template = <<-TEMPLATE
<h1><%= title %></h1>
<ul>
<% items.each do |item| %>
  <li><%= item %></li>
<% end %>
</ul>
      TEMPLATE

      html = TestERBMethod.new.erb(template, options)

      expect(html).to eq(<<-RESULT)
<h1>this is a title</h1>
<ul>

  <li>Item 1</li>

  <li>Item 2</li>

</ul>
      RESULT
    end

    it "wraps content in a layout" do
      options = {
        :layout => "<main><%= yield %></main>",
        :locals => {
          :name => "some name"
        }
      }
      template = "<%= name %>"
      html = TestERBMethod.new.erb(template, options)

      expect(html).to eq("<main>some name</main>")
    end
  end
end