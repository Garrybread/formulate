Trestle.resource(:stores) do
  menu do
    item :stores, icon: "fa fa-star"
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :name
    column :street
    column :city
    column :state
    column :country
    column :latitude
    column :longitude
    column :photo, ->(photo) { image_tag(main_app.rails_representation_url(photo.photo.variant(resize_to_fill: [100, 100]).processed, only_path: true)) if photo.photo.present? }
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |store|
    text_field :name
    text_field :street
    text_field :city
    text_field :state
    text_field :country
    text_field :latitude
    text_field :longitude
    file_field :photo
  
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:store).permit(:name, ...)
  # end
end
