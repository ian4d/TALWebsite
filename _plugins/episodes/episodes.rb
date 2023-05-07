module EpisodePage
    class EpisodePageGenerator < Jekyll::Generator
        def generate(site)
            if site.data.include? "episodeList"
               for episode in site.data["episodeList"]
                     @actualEp = site.data["episodes"]["episode-" + episode["number"].to_s]
                     site.pages << EpisodePage.new(site, @actualEp)
               end
           end
        end
    end

    class EpisodePage < Jekyll::Page
        def initialize(site, episode)
            @site = site             # the current site instance.
            @base = site.source      # path to the source directory.
            @dir = "episodes"
      
            # All pages have the same filename, so define attributes straight away.
            @basename = "episode" + episode["episodeNumber"].to_s      # filename without the extension.
            @ext      = '.html'      # the extension.
            @name     = @basename + @ext # basically @basename + @ext.

            # This allows accessing the list in a template via `page.linked_docs`.
            @data = {}
            self.data["title"] = episode["episodeTitle"].to_s
            self.data["episode"] = episode

            # Look up front matter defaults scoped to type `episodes`, if given key
            # doesn't exist in the `data` hash.
            data.default_proc = proc do |_, key|
              site.frontmatter_defaults.find(relative_path, :episodes, key)
            end
          end
      
          # Placeholders that are used in constructing page URL.
          def url_placeholders
            {
              :path       => @dir,
              :category   => @dir,
              :basename   => basename,
              :output_ext => output_ext,
            }
          end
    end

end