class QuestionType < ActiveHash::Base
    self.data = [
      {
        id: 1,
        name: "text_input",
        # serialize: ->(val) {},
        # deserialize: ->(val) {},
      },
      {
        id: 2,
        name: "radio",
        # serialize: ->(val) {},
        # deserialize: ->(val) {},
      },
      {
        id: 3,
        name: "select",
        # serialize: ->(val) {},
        # deserialize: ->(val) {},
      },
      {
        id: 4,
        name: "checkbox",
        # serialize: ->(val) {},
        # deserialize: ->(val) {},
      }
    ]
  end