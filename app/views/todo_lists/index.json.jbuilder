json.array!(@todo_lists) do |todo_list|
    json.extract! todo_list, :id, :description
    json.url todo_list_url(todo_list, format: :json)
end
