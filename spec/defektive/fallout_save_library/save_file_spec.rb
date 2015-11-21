require 'spec_helper'

module Defektive::FalloutSaveLibrary
  describe SaveFile do
    before do
      file = File.open("./spec/defektive/save-1.fos", 'rb')
      @save_file = SaveFile.read(file)
    end

    it 'should have correct save type' do
      expect(@save_file.save_type).to eq "FO4_SAVEGAME"
    end

    it 'should have correct header length' do
      expect(@save_file.header_length).to eq 108
    end

    context "header" do
      it 'should have correct character name' do
        expect(@save_file.character_name).to eq "brad"
      end

      it 'should have correct level' do
        expect(@save_file.level).to eq 11
      end

      it 'should have correct location' do
        expect(@save_file.location).to eq "Commonwealth"
      end

      it 'should have correct duration' do
        expect(@save_file.duration).to eq "0d.18h.22m.0 days.18 hours.22 minutes"
      end

      it 'should have correct race' do
        expect(@save_file.race).to eq "HumanRace"
      end

      it 'should have correct sex' do
        expect(@save_file.sex).to eq 0
      end

      it 'should have correct screenshot width' do
        expect(@save_file.screenshot_width).to eq 640
      end

      it 'should have correct screenshot_height' do
        expect(@save_file.screenshot_height).to eq 384
      end
      
    end

    context "Stats" do

      it 'should have correct game version' do
        expect(@save_file.game_version).to eq "1.1.30.0"
      end

      it 'should have correct plugin name' do
        expect(@save_file.plugin_name).to eq "Fallout4.esm"
      end

      it 'should have stats' do
        expect(@save_file.stat_length).to eq 87
      end

      it 'should have stats with names and values' do
        @save_file.stats.each do |stat|
          expect(stat.name).to_not be_empty
          expect(stat.stat_value).to be >= 0
        end
      end
    end

    xcontext "WTF is this" do
      it "should have a first skip" do
        expect(@save_file.skip_1).to eq "\x00\x00\v\x00\x00\x00\t\x00\x00\x00"
      end
      it "should have a second skip" do
        expect(@save_file.skip_2).to eq "\x00\x00"
      end
      it "should have a third skip" do
        expect(@save_file.skip_3).to eq "\u0000\u0000"
      end
    end
  end
end
