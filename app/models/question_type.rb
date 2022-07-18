class QuestionType < ActiveHash::Base
  self.data = [
    {
      id: 1,
      name: "text_input",
      has_options: false,
      # serialize: ->(val) {},
      # deserialize: ->(val) {},
    },
    {
      id: 2,
      name: "radio",
      has_options: true,
      # serialize: ->(val) {},
      # deserialize: ->(val) {},
    },
    {
      id: 3,
      name: "select",
      has_options: true,
      # serialize: ->(val) {},
      # deserialize: ->(val) {},
    },
    {
      id: 4,
      name: "checkbox",
      has_options: true,
      # serialize: ->(val) {},
      # deserialize: ->(val) {},
    }
  ]
end