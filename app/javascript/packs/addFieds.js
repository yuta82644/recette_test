// app/javascript/packs/addFields.js

const addFields = (event) => {
  event.preventDefault();

  const container = document.getElementById("cooking_ingredients");
  const newField = document.createElement("div");
  newField.classList.add("form-group", "nested-fields");

  newField.innerHTML = `
    <label for="recipe_cooking_ingredients_attributes_new_ingredient_name">材料名</label>
    <input type="text" id="recipe_cooking_ingredients_attributes_new_ingredient_name" name="recipe[cooking_ingredients_attributes][][ingredient_name]" class="form-control" />

    <div class="form-row">
      <div class="form-group col-md-4">
        <label for="recipe_cooking_ingredients_attributes_new_quantity">数量</label>
        <input type="number" id="recipe_cooking_ingredients_attributes_new_quantity" name="recipe[cooking_ingredients_attributes][][quantity]" class="form-control" />
      </div>

      <div class="form-group col-md-4">
        <label for="recipe_cooking_ingredients_attributes_new_unit">単位</label>
        <input type="text" id="recipe_cooking_ingredients_attributes_new_unit" name="recipe[cooking_ingredients_attributes][][unit]" class="form-control" />
      </div>
    </div>

    <button class="btn btn-danger" onclick="removeField(this)">削除</button>
  `;

  container.appendChild(newField);
};

const removeField = (button) => {
  const field = button.closest(".nested-fields");
  field.remove();
};

export { addFields, removeField };
