module Defektive
  module FalloutSaveLibrary

    class StatString < ::BinData::Record
      endian :little

      int16 :name_length
      string :name, :read_length => :name_length
      skip length: 1
      int32 :stat_value
    end

    class SaveFile < ::BinData::Record
      endian :little
      string :save_type, length: 12
      int16 :header_length

      # save the data instead of skipping it
      # skip length: 10
      string :skip_1, read_length: 10

      int16 :character_name_len
      string :character_name, :read_length => :character_name_len
      int16 :level

      # save the data instead of skipping it
      # skip length: 10
      string :skip_2, read_length: 2

      int16  :location_length
      string :location, :read_length => :location_length

      int16  :duration_length
      string :duration, :read_length => :duration_length

      int16  :race_length
      string :race, :read_length => :race_length

      int16  :sex

      string :skip_3, :read_length => 16
      #
      int32 :screenshot_width
      int32 :screenshot_height

      string :screenshot, :read_length => lambda { (screenshot_height * screenshot_width * 4)}

      # # not sure whats here
      # skip length: 245761

      skip length: 1
      int16 :game_version_length
      string :game_version, :read_length => :game_version_length

      int16 :unknown_number # could be plugin count, should be 1 but its not. so IDK
      skip length: 3

      int16 :plugin_name_length
      string :plugin_name, :read_length => :plugin_name_length

      skip length: 108

      int16 :stat_length
      skip length: 2

      # stat_string :stat1
      array   :stats, :initial_length => :stat_length, :type => :stat_string
    end

  end
end


# @header[:extra_bytes] = []
#
# # not sure whats in these 11 bytes
# @header[:extra_bytes].push read_byte_array(11, raw_header)
#
# @character_name = read_next(raw_header)
# @level = raw_header.readbyte
#
# # not sure whats in these 3 bytes
# @header[:extra_bytes].push read_byte_array(3, raw_header)
#
# @location = read_next(raw_header)
# @duration = read_next(raw_header)
# @race = read_next(raw_header)
# @sex = read_next(raw_header)
#
# # not sure whats left
# @header[:extra_bytes].push read_byte_array_eof(raw_header)
