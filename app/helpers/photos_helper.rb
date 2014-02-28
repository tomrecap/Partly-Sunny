module PhotosHelper

  def truncate_fuzzy_time(fuzzy_time_string)
    first_digit_index = fuzzy_time_string.index(/\d/)
    return "0 m" unless first_digit_index

    next_letter_index = first_digit_index + 1 +
      fuzzy_time_string[first_digit_index...fuzzy_time_string.length].index(/\D/)

    fuzzy_time_string[first_digit_index..next_letter_index]
  end

  def tags_to_string
    tags.map{ |tag| link_to tag_gallery_url(tag) }.join(", ")
  end

end
