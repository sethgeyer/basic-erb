require "spec_helper"

describe HTMLGenerator do
  def html_generator
    HTMLGenerator.new
  end

  def strip_whitespace(string)
    string.gsub(/\s+/, "")
  end

  describe "#section" do
    it "returns a string of html that has a section containing the text" do
      section_html = html_generator.section("this is the body of a section")

      expect(section_html).to eq("<section>this is the body of a section</section>")
    end
  end

  describe "#unordered_list" do
    it "returns a string of html that contains the list" do
      list_html = strip_whitespace(
        html_generator.unordered_list(["item1", "item2", "item3"])
      )

      expect(list_html).to eq("<ul><li>item1</li><li>item2</li><li>item3</li></ul>")
    end
  end

  describe "#button" do
    it "returns a string of html that has a button with text" do
      skip
      button_html = html_generator.button("this is button text")

      expect(button_html).to eq("<button>this is button text</button>")
    end

    context "with a class attribute given" do
      it "returns the button with a class attribute" do
        skip
        button_html = html_generator.button("flashy button", :class => "flashy_class")

        expect(button_html).to eq("<button class='flashy_class'>flashy button</button>")
      end
    end
  end

  context "with a layout" do
    it "returns wraps all html in the layout by replacing yield" do
      html_generator = HTMLGenerator.new("<main>yield</main>")
      expect(html_generator.section("section text")).to eq("<main><section>section text</section></main>")

      html_generator = HTMLGenerator.new("<div>yield</div>")
      expect(html_generator.unordered_list(["an item"])).to eq("<div><ul><li>an item</li></ul></div>")

      html_generator = HTMLGenerator.new("<section>yield</section>")
      expect(html_generator.button("a button in a section")).to eq("<section><button>a button in a section</button></section>")
    end
  end
end