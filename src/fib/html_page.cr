class HtmlPage

  def initialize
    @fragments = [] of String
  end

  def add_fragment fragment
    @fragments << fragment
  end

  def render
    return "<html><body>#{concat_fragments}</body></html>"
  end

  private def concat_fragments 
    @fragments.join
  end

end