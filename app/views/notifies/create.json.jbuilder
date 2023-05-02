if @notify.persisted?
  json.item render_to_string(partial: "rides/notify", formats: :html, locals: { notify: @notify })
else
  json.errors { @notify.errors }
end
