# frozen_string_literal: true

task destroy_expired: :environment do
  DestroyExpired.new.destroy_lists
  DestroyExpired.new.destroy_to_dos
end

task activate_due: :environment do
  ActivateDue.new.activate_to_dos
end
