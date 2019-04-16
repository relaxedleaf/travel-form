module ManagesHelper
    
  def date_formatter(date)
    date = date.to_s[0,10].split('-')
    return date[1] + "/" + date[2] + "/" + date[0]
  end
  
end
