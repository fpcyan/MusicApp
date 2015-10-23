module ApplicationHelper
  include ERB::Util

  def lyrics_link(track)
    <<-HTML.html_safe
      <a href="<%= lyrics_track %>">
        #{h(track.lyrics[0..100])}
      </a>
    HTML
  end

  def ugly_lyrics(track)
    ugly = []
    lyrics = track.lyrics.dup
    until lyrics.empty?
      ugly << lyrics.slice!(/.{0,30}[\.\?\!\,]?\s?/)
    end
    html = ""
    ugly.each do |line|
      html += "♫ + #{h(line)} + \n"
    end
    html.html_safe
  end

end
