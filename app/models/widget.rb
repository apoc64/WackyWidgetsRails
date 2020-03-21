class Widget < ApplicationRecord
  belongs_to :user
  enum color: %i[red blue green yellow purple]

  def self.all_public
    where(is_public: true)
  end

  def self.color_options
    colors.keys
  end

  def self.publish
    file_name = 'widgets.json'
    data = all.to_json
    file = Tempfile.new(file_name)
    file.write(data)
    file.rewind
    file.close

    s3 = Aws::S3::Resource.new(region: ENV['AWS_REGION'])
    bucket = s3.bucket(ENV['AWS_BUCKET'])

    object = bucket.object(file_name)
    object.upload_file(file.path)
  end
end
