module RecipesHelper
  def public_post?
    params["recipe"] && params["recipe"]["public_post"].present?
  end
end
