xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Wasted time projects"
    xml.description "gallery of great stuff that got born while wasting time"
    xml.link "http://wastedtimeprojects.com"
    
    for project in @projects
      xml.item do
        xml.title h(project.name)
        xml.description "#{image_tag(project.preview.url(:medium), :alt => h(project.name))}<br />#{h(project.description)}"
        xml.pubDate project.created_at.to_s(:rfc822)
        xml.link project.url
        xml.guid project_url(project)
      end
    end
  end
end

