const pool = require('../db')

// Get all recipe 
async function getRecipeData(req, res) {
    try{
        const { rows } = await pool.query('SELECT * FROM public.recipe');
        res.json(rows);
    } catch (error) {
        console.error('Error executing query', error);
        res.status(500).send('Internal Server Error');
    }
}

// Get ingredient by recipe id
async function getIngredientByRecipeName(req, res) {
    const { recipe_name } = req.params;
    try {
        const { rows } = await pool.query('SELECT i.ing_id, i.recipe_id, i.ing_name, i.ing_amount, i.ing_is_optional FROM public.ingredient AS i RIGHT JOIN public.recipe AS r ON r.recipe_id = i.recipe_id WHERE r.recipe_name LIKE $1', [`%${recipe_name}%`]);
        res.json(rows);
    } catch (error) {
        console.error('Error executing query', error);
        res.status(500).send('Internal Server Error');
    }
}

// Get instruction by recipe id
async function getInstructionByRecipeName(req, res) {
    const { recipe_name } = req.params;
    try {
        const { rows } = await pool.query('SELECT d.dir_id, d.recipe_id, d.dir_ins FROM public.direction AS d RIGHT JOIN public.recipe AS r ON r.recipe_id = d.recipe_id WHERE r.recipe_name LIKE $1', [`%${recipe_name}%`]);
        res.json(rows);
    } catch (error) {
        console.error('Error executing query', error);
        res.status(500).send('Internal Server Error');
    }
}

// Create new recipe
async function createRecipe(req, res) {
    const { recipe_name, recipe_prep_time, recipe_cook_time, recipe_servings } = req.body;
    try {
        const { rows } = await pool.query('INSERT INTO public.recipe (recipe_name, recipe_prep_time, recipe_cook_time, recipe_servings) VALUES ($1, $2, $3, $4) RETURNING *', [recipe_name, recipe_prep_time, recipe_cook_time, recipe_servings]);
        res.json(rows[0]);
    } catch (error) {
        console.error('Error executing query', error);
        res.status(500).send('Internal Server Error');
    }
}

// Create new ingredient by recipe id
async function createIngredientByRecipeId(req, res) {
    const { recipe_id } = req.params;
    const { ing_name, ing_amount, ing_is_optional } = req.body;
    try {
        const { rows } = await pool.query('INSERT INTO public.ingredient (recipe_id, ing_name, ing_amount, ing_is_optional) VALUES ($1, $2, $3, $4) RETURNING *', [recipe_id, ing_name, ing_amount, ing_is_optional]);
        res.json(rows[0]);
    } catch (error) {
        console.error('Error executing query', error);
        res.status(500).send('Internal Server Error');
    }
}

// Create new instruction by recipe id
async function createInstructionByRecipeId(req, res) {
    const { recipe_id } = req.params;
    const { dir_ins } = req.body;
    try {
        const { rows } = await pool.query('INSERT INTO public.direction (recipe_id, dir_ins) VALUES ($1, $2) RETURNING *', [recipe_id, dir_ins]);
        res.json(rows[0]);
    } catch (error) {
        console.error('Error executing query', error);
        res.status(500).send('Internal Server Error');
    }
}

// Update recipe by id
async function updateRecipeById(req, res) {
    const { recipe_id } = req.params;
    const { recipe_name, recipe_prep_time, recipe_cook_time, recipe_servings } = req.body;
    try {
        const { rows } = await pool.query('UPDATE public.recipe SET recipe_name = $1, recipe_prep_time = $2, recipe_cook_time = $3, recipe_servings = $4 WHERE recipe_id = $5 RETURNING *', [recipe_name, recipe_prep_time, recipe_cook_time, recipe_servings, recipe_id]);
        res.json(rows[0]);
    } catch (error) {
        console.error('Error executing query', error);
        res.status(500).send('Internal Server Error');
    }
}

// Update ingredient by recipe id and ingredient id
async function updateIngredientByIdAndRecipeId(req, res) {
    const { recipe_id } = req.params;
    const {  ing_id, ing_name, ing_amount, ing_is_optional } = req.body;
    try {
        const { rows } = await pool.query('UPDATE public.ingredient SET ing_name = $1, ing_amount = $2, ing_is_optional = $3 WHERE ing_id = $4 AND recipe_id = $5 RETURNING *', [ing_name, ing_amount, ing_is_optional, ing_id, recipe_id]);
        res.json(rows[0]);
    } catch (error) {
        console.error('Error executing query', error);
        res.status(500).send('Internal Server Error');
    }
}

// update instruction by recipe id and dir id
async function updateInstructionByIdAndRecipeId(req, res) {
    const { recipe_id } = req.params;
    const {  dir_id, dir_ins } = req.body;
    try {
        const { rows } = await pool.query('UPDATE public.direction SET dir_ins = $1 WHERE dir_id = $2 AND recipe_id = $3 RETURNING *', [dir_ins, dir_id, recipe_id]);
        res.json(rows[0]);
    } catch (error) {
        console.error('Error executing query', error);
        res.status(500).send('Internal Server Error');
    }
}

// delete recipe by id
async function deleteRecipeById(req, res) {
    const { recipe_id } = req.params;
    try {
        await pool.query('DELETE FROM public.recipe WHERE id = $1', [recipe_id]);
        res.json({ message: 'Recipe deleted successfully' });
    } catch (error) {
        console.error('Error executing query', error);
        res.status(500).send('Internal Server Error');
    }
}

// delete a certain ingredient by id by recipe id
async function deleteIngredientByIdAndRecipeId(req, res) {
    const { recipe_id } = req.params;
    const { ing_id } = req.body;
    try {
        await pool.query('DELETE FROM public.ingredient WHERE ing_id = $1 AND recipe_id = $2', [ing_id, recipe_id]);
        res.json({ message: 'Ingredient deleted successfully' });
    } catch (error) {
        console.error('Error executing query', error);
        res.status(500).send('Internal Server Error');
    }
}

// delete a certain instruction by id by recipe id
async function deleteInstructionByIdAndRecipeId(req, res) {
    const { recipe_id } = req.params;
    const { dir_id } = req.body;
    try {
        await pool.query('DELETE FROM public.direction WHERE dir_id = $1 AND recipe_id = $2', [dir_id, recipe_id]);
        res.json({ message: 'Instruction deleted successfully' });
    } catch (error) {
        console.error('Error executing query', error);
        res.status(500).send('Internal Server Error');
    }
}

module.exports = {
    getRecipeData,
    getIngredientByRecipeName,
    getInstructionByRecipeName,
    createRecipe,
    createIngredientByRecipeId,
    createInstructionByRecipeId,
    updateRecipeById,
    updateIngredientByIdAndRecipeId,
    updateInstructionByIdAndRecipeId,
    deleteRecipeById,
    deleteIngredientByIdAndRecipeId,
    deleteInstructionByIdAndRecipeId
}