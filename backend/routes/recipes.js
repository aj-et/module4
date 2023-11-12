const express = require('express');
const router = express.Router();

const recipeController =require('../controllers/recipe')

router.get('/', recipeController.getRecipeData);

router.get('/ingredients/:recipe_id', recipeController.getIngredientByRecipeId);

router.get('/instructions/:recipe_id', recipeController.getInstructionByRecipeId);

router.post('/', recipeController.createRecipe);

router.post('/ingredients/:recipe_id', recipeController.createIngredientByRecipeId);

router.post('/instructions/:recipe_id', recipeController.createInstructionByRecipeId);

router.put('/:recipe_id', recipeController.updateRecipeById);

router.put('/ingredients/:recipe_id', recipeController.updateIngredientByIdAndRecipeId);

router.put('/instructions/:recipe_id', recipeController.updateInstructionByIdAndRecipeId);

router.delete('/:recipe_id', recipeController.deleteRecipeById);

router.delete('/ingredients/:recipe_id', recipeController.deleteIngredientByIdAndRecipeId);

router.delete('/instructions/:recipe_id', recipeController.deleteInstructionByIdAndRecipeId);

module.exports = router;