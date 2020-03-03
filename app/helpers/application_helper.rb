module ApplicationHelper
  def report_photo(report)
    if report.photo.attached?
      cl_image_path report.photo.key, crop: :fill
    else
      image_path "clouds-default-img.png"
    end
  end
end
