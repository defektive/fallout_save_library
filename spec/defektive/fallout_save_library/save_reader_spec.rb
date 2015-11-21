require 'spec_helper'

module Defektive::FalloutSaveLibrary
  describe SaveReader do
    before do
      @save_reader = SaveReader.new("./spec/defektive/save-1.fos")
    end

    it 'should match the file type' do
      expect(@save_reader.file_type).to eq "FO4_SAVEGAME"
    end

    it 'should have correct character_name' do
      expect(@save_reader.character_name).to eq "brad"
    end

    it 'should have correct level' do
      expect(@save_reader.level).to be 11
    end

    it 'should have correct location' do
      expect(@save_reader.location).to eq "Commonwealth"
    end

    it 'should have correct duration' do
      expect(@save_reader.duration).to eq "0d.18h.22m.0 days.18 hours.22 minutes"
    end

    it 'should have correct race' do
      expect(@save_reader.race).to eq "HumanRace"
    end

    it 'should have correct sex' do
      expect(@save_reader.sex).to eq "HumanRace"
    end

    it 'need to figure this out' do
      expect(@save_reader.header[:extra_bytes]).to eq "???"
    end

  end
end
