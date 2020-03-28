class AwsUploader

  def self.upload(data, file_name)
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
