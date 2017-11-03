if bench
  json.extract! bench, :id, :description, :lat, :lng
else
  {}
end
