# frozen_string_literal: true

shared_examples_for 'future_validator' do
  describe '#valid?' do
    it 'is true if date is in future' do
      record.send("#{attribute}=", Date.tomorrow)
      expect(record.valid?).to eq(true)
    end

    it 'is false if date is today' do
      record.send("#{attribute}=", Date.current)

      expect(record.valid?).to eq(false)

      expect(
        record.errors.messages[:scheduled_date]
      ).to contain_exactly(
        I18n.t(
          "activemodel.errors.models.#{record.class.name.underscore}.attributes.scheduled_date.not_in_future"
        )
      )
    end

    it 'is false if date is in past' do
      record.send("#{attribute}=", Date.yesterday)

      expect(record.valid?).to eq(false)

      expect(
        record.errors.messages[:scheduled_date]
      ).to contain_exactly(
        I18n.t(
          "activemodel.errors.models.#{record.class.name.underscore}.attributes.scheduled_date.not_in_future"
        )
      )
    end
  end
end
