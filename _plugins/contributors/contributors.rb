module ContributorPage
    class ContributorPageGenerator < Jekyll::Generator
        def generate(site)
           if site.data.include? "contributorList"
               for contributor in site.data["contributorList"]
                    @actualContributor = site.data["contributors"][contributor["name"].tr_s(" ","_")]
                    site.pages << ContributorPage.new(site, @actualContributor)
               end
           end
        end
    end

    class ContributorPage < Jekyll::Page
        def initialize(site, contributor)
            @site = site             # the current site instance.
            @base = site.source      # path to the source directory.
            @dir = "contributors"

            puts "CONTRIBUTOR: "
            puts contributor

            # All pages have the same filename, so define attributes straight away.
            @basename = contributor["name"].downcase.tr_s(" ","-")      # filename without the extension.
            @ext      = '.html'      # the extension.
            @name     = @basename + @ext # basically @basename + @ext.

            # This allows accessing the list in a template via `page.linked_docs`.
            @data = {}
            self.data["title"] = contributor["name"]
            self.data["contributor"] = contributor

            puts @data
            # Look up front matter defaults scoped to type `categories`, if given key
            # doesn't exist in the `data` hash.
            data.default_proc = proc do |_, key|
              site.frontmatter_defaults.find(relative_path, :contributors, key)
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