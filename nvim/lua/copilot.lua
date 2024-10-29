local Job = require "plenary.job"

local M = {} -- Table to store the module

-- local instruction =
-- "You follow instructions exactly. Please generate a single concise javadoc/docstring to be PREPENDED to this snippet ensuring it follows the languages standard style guide. Ensure you include descriptions of parameters/attributes, return types, and exceptions (if applicable). DO NOT INCLUDE THE CODE, ONLY documentation to be PREPENDED to the snippet. Please DO NOT provide any pre/post amble or markdown formatting!"

local instruction =
  "Generate a concise summary of this code in the form of a javadoc/docstring conforming to the style standards of the langauge. Please do NOT include the snippet, markdown formatting or any pre/post amble."

M.SendSelectedTextToAPI = function()
  vim.cmd "normal! gv"
  -- Get the selected text
  local start_pos = vim.fn.getpos "'<"
  local end_pos = vim.fn.getpos "'>"
  local lines = vim.fn.getline(start_pos[2], end_pos[2])

  -- Ensure `lines` is always a table
  if type(lines) == "string" then
    lines = { lines }
  end

  -- Join the selected lines into a single string
  local selected_text = table.concat(lines, "\n")
  print(vim.inspect(selected_text))

  -- Define the API endpoint
  local api_url = "http://localhost:21434/v1/chat/completions"

  -- Prepare the message payload
  local message = { role = "user", content = instruction .. "\n" .. selected_text }

  -- Prepare the completion request payload
  local completion = { model = "llama3", messages = { message } }

  -- Convert the Lua table to a JSON string
  local json_str = vim.fn.json_encode(completion)

  -- Make the HTTP request
  Job:new({
    command = "curl",
    args = { "-X", "POST", "-H", "Content-Type: application/json", "-d", json_str, api_url },
    on_exit = function(job, return_val)
      if return_val == 0 then
        local response = table.concat(job:result(), "\n")

        vim.schedule(function()
          -- Parse the JSON response to a Lua table
          local ok, response_table = pcall(vim.fn.json_decode, response)

          if not ok or not response_table then
            print "Failed to decode JSON response"
            return
          end

          -- Check if the response has the expected structure
          local response_content = response_table.choices
            and response_table.choices[1]
            and response_table.choices[1].message
            and response_table.choices[1].message.content

          if response_content then
            -- Save the response to the clipboard
            vim.fn.setreg("+", response_content)
            print "Response copied to clipboard!"
          else
            print "Invalid response structure!"
          end
        end)
      else
        print "Failed to send the request"
      end
    end,
  }):start()
end

return M
