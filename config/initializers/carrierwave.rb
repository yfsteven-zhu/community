module CarrierWave
  module MiniMagick
    def quality(percentage)
      manipulate! do |img|
        img.quality(percentage.to_s)
        img = yield(img) if block_given?
        img
      end
    end

    def unsharp(type=:big)
      param = case type.to_sym
                when :thumb then "0x0.75+0.75+0.008"
                when :big then "1.5x3+0.3+0.01"
              end
      manipulate! do |img|
        img.unsharp param
        img = yield(img) if block_given?
        img
      end
    end
  end
end