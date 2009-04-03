class String
  def camel_case
    gsub(/(^|_|-)(.)/) { $2.upcase }
  end
end