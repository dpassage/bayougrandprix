require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe ApplicationHelper do
  describe "#markdown_render" do
    it "returns text rendered in html using markdown" do
      @before = "This is *bongos*, indeed."
      markdown_render(@before).should == "<p>This is <em>bongos</em>, indeed.</p>\n"
    end
  end
end
