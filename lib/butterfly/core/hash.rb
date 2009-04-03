# So we can call methods directory on the hash object
# rather than having to call [] on it.
class Hash
  def method_missing(m,*a,&block)
    if has_key?(m)
      self[m]
    else
      super
    end
  end
end