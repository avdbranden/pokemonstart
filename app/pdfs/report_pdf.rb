# See https://www.sitepoint.com/pdf-generation-rails/
# And see http://www.idyllic-software.com/blog/creating-pdf-using-prawn-in-ruby-on-rails/

class ReportPdf < Prawn::Document

  def initialize(attributes, view, current_user)
    super()
    @current_user = current_user
    @type_sets = attributes.keys
    @data_sets = attributes.values
    @view = view
    @counter = 0
    # text "Report #{@type_sets} #{@data_sets}"
    header
    thanks_message
    table_content
  end

  def header
    #This inserts an image in the pdf file and sets the size of the image
    image "#{Rails.root}/app/assets/images/mew.png", width: 100, height: 100
    draw_text "Data Privacy Report", :at => [170, 575], size: 22
  end

  def thanks_message
    move_down 150
    text "Hello #{@current_user.first_name},"
    move_down 15
    text "Below is a summary of your data currently processed by
    Pokémon Starter."
    move_down 50
  end

  def table_content
    # This makes a call to product_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths
    table data_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [40, 150, 200, 100]
    end
  end

  def data_rows
    [["#", "Type", "Data", "As from"]] +
      @type_sets.map do |type|
      ["#{@counter += 1}", type, @data_sets.shift, @current_user.created_at.strftime("%b %d, %Y")]
    end
  end
end
