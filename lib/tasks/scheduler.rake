# frozen_string_literal: true

task destroy_expired: :environment do
  DestroyExpired.new.destroy_lists
  DestroyExpired.new.destroy_to_dos
end
