class PathParser

  getter :path

  def initialize(path)
    path_components = path.split("?")
    @path = path_components.first[1..-1]

    @params = {} of String => String

    query = path_components[1] # a=1&b=2
    query_components = query.split("&") # [a=1, b=2]

    query_components.each do |elem|
      name, value = elem.split("=")
      @params[name] = value
    end
  end

  def param(key)
    @params.fetch(key, "")
  end

end