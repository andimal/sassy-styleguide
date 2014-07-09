class StyleguideController < ApplicationController

  def index
    filename          = "app/assets/stylesheets/_variables.css.sass"
    section           = ""
    @styleguide_vars  = {}

    file = File.new(filename, "r")
    file.each do |line|
      if line.present?
        if line.split().first(2).first == "//"
          if section == ""
            section = line.split().first(2).last
          else
            section = ""
          end

        else
          line_split = line.split(/ : */, 2)
          @styleguide_vars[section] = [] if @styleguide_vars[section].nil?
          @styleguide_vars[section].push( {var: line_split.first.strip!, val: line_split.last} )
        end
      end
    end
    file.close
  end
end
