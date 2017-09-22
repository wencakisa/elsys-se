require 'csv'

def get_rows_as_hash(filename)
  result = Hash.new(0)

  CSV.foreach(filename) do |row|
    video_id = row[1]
    video_watching_percentage = row[2].to_f

    result[video_id] += video_watching_percentage
  end

  result
end

def get_most_watched_video(video_hash)
  video_hash.max_by { |pair| pair[1] }
end

rows = get_rows_as_hash(ARGV.fetch(0, './file.csv'))

most_watched_video = get_most_watched_video(rows)
most_watched_video_id = most_watched_video[0]
most_watched_video_views = most_watched_video[1]

puts "Most watched video is ##{most_watched_video_id}: #{most_watched_video_views} views."
