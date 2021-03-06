require "capybara-select2/version"

module Capybara
  module Select2
    def select2(value, options = {})
      raise "Must pass a hash containing 'from'" if not options.is_a?(Hash) or not options.has_key?(:from)
      select_name = options[:from]

      select2_container=find("label", text: select_name).find(:xpath, '..').find(".select2-container")
      PP.pp(select2_container)

      select2_container.find(".select2-choice").click

      find(".select2-drop li", text: value).click
    end
  end
end

RSpec.configure do |c|
  c.include Capybara::Select2
end
