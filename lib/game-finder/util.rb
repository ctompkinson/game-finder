# Helper methods for misc utilities
module Util
  # rubocop:disable Style/EachWithObject
  def symbolize(obj)
    if obj.is_a? Hash
      return obj.reduce({}) do |memo, (k, v)|
        memo.tap { |m| m[k.to_sym] = symbolize(v) }
      end
    end

    if obj.is_a? Array
      return obj.reduce([]) do |memo, v|
        memo << symbolize(v)
        memo
      end
    end

    obj
  end
end
