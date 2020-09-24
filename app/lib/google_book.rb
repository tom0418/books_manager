class GoogleBook
  attr_reader :googlebooksapi_id, :title, :author, :published_date, :isbn10, :isbn13, :description

  class << self
    include GoogleBooksApi

    def new_from_id(googlebooksapi_id)
      url = url_of_creating_from_id(googlebooksapi_id)
      item = get_json_from_url(url)
      new(item)
    end

    def search(keyword)
      url = url_of_searching_from_keyword(keyword)
      json = get_json_from_url(url)
      item = json["items"].first

      new(item) if item.present?
    end
  end

  def initialize(item)
    @item = item
    @volume_info = @item["volumeInfo"]
    retrieve_attribute
    retrieve_attribute_isbn
  end

  def retrieve_attribute
    @title = @volume_info["title"]
    @author = @volume_info["authors"]
    @published_date = @volume_info["publishedDate"]
    @description = @volume_info["description"]
  end

  def retrieve_attribute_isbn
    @industry_identifiers = @volume_info["industryIdentifiers"]
    if @industry_identifiers[0]["type"] == "ISBN_10"
      @isbn10 = @volume_info["industryIdentifiers"][0]["identifier"]
      @isbn13 = @volume_info["industryIdentifiers"][1]["identifier"]
    else
      @isbn10 = @volume_info["industryIdentifiers"][1]["identifier"]
      @isbn13 = @volume_info["industryIdentifiers"][0]["identifier"]
    end
  end
end
