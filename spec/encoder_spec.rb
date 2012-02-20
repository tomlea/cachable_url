require "spec_helper"

describe CachableUrl do

  EXAMPLES=[
    "http://foo:bar@baz.com/wizz?bang=foo",
    "http://foo:bar@baz.com/wi???bang=baz"
  ]

  EXAMPLES.each do |example|

    it "symmetrically encodes/decodes #{example}" do
      original_value = example
      encoded_value = CachableUrl.encode(example)
      decoded_value = CachableUrl.decode(encoded_value)
      decoded_value.should == original_value
    end

    it "should encode without any '?'s in it" do
      CachableUrl.encode(example).should_not include("?")
    end

  end

end
