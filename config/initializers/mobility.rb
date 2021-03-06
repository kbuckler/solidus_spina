# frozen_string_literal: true

if Rails.env.test?
  Mobility.configure do
    plugins do
      backend :table
      active_record
      reader
      writer
      backend_reader
      query
      cache
      presence
      fallbacks false # default to false, enable if passed fallbacks: true
      default
    end
  end
end
