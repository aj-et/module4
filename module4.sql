-- Table structure for table `recipe`
CREATE TABLE IF NOT EXISTS public.recipe (
    recipe_id INT NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    recipe_name CHARACTER varying NOT NULL,
    recipe_prep_time CHARACTER varying NOT NULL,
    recipe_cook_time CHARACTER varying NOT NULL,
    recipe_servings CHARACTER varying NOT NULL,
    CONSTRAINT recipe_pk PRIMARY KEY (recipe_id)
);

-- Data for table `recipe`
INSERT INTO public.recipe (
    recipe_name,
    recipe_prep_time,
    recipe_cook_time,
    recipe_servings
)
VALUES (
    'chicken adobo',
    '5 mins',
    '35 mins',
    '4'
), (
    'pork sisig',
    '12 mins',
    '1 hour 30 mins',
    '6'
), (
    'pork giniling',
    '10 mins',
    '40 mins',
    '6'
), (
    'bulalo',
    '15 mins',
    '5 hrs',
    '4'
), (
    'texas style smoked beef brisket',
    '30 mins',
    '15 hrs',
    '18'
);

-- Table structure for table `ingredient`
CREATE TABLE IF NOT EXISTS public.ingredient (
    ing_id INT NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    ing_name CHARACTER varying NOT NULL,
    ing_amount CHARACTER varying,
    ing_is_optional BOOLEAN,
    recipe_id INT NOT NULL,
    CONSTRAINT ingredient_pk PRIMARY KEY (ing_id)
);

-- Create relationship between `recipe` and `ingredient` tables
ALTER TABLE IF EXISTS public.ingredient
    ADD CONSTRAINT fk_ingredient FOREIGN KEY (recipe_id)
    REFERENCES public.recipe (recipe_id) MATCH SIMPLE
    ON UPDATE CASCADE
	ON DELETE NO ACTION;

-- Data for table `ingredient`
INSERT INTO public.ingredient (
    recipe_id,
    ing_name,
    ing_amount,
    ing_is_optional
)
VALUES 
    (1, 'chicken thigh fillet', '2 lbs', FALSE), 
    (1, 'dried bay leaves', '3 pieces', FALSE),
    (1, 'soy sauce', '6 tablespoons', FALSE),
    (1, 'white vinegar', '4 tablespoons', FALSE),
    (1, 'garlic', '5 cloves', FALSE),
    (1, 'water', '1 1/2 cups', FALSE),
    (1, 'cooking oil', '3 tablespoons', FALSE),
    (1, 'sugar', '1 teaspoon', FALSE),
    (1, 'salt', '1/4 teaspoon', FALSE),
    (1, 'whole peppercorn', '1 teaspoon', FALSE),
    (2, 'pig ears', '1 lb', FALSE),
    (2, 'pork belly', '1 1/2 lbs', FALSE),
    (2, 'minced onion', '1 piece', FALSE),
    (2, 'soy sauce', '3 tablespoons', FALSE),
    (2, 'black pepper', '1/4 teaspoon', FALSE),
    (2, 'minced ginger', '1 knob', TRUE),
    (2, 'chili flakes', '3 tablespoons', FALSE),
    (2, 'garlic powder', '1/2 teaspoon', FALSE),
    (2, 'calamansi', '3 to 5 pieces', FALSE),
    (2, 'butter', '1/2 cup', FALSE),
    (2, 'chicken liver', '1/4 lb', FALSE),
    (2, 'water', '6 cups', FALSE),
    (2, 'mayonnaise', '3 tablespoons', FALSE),
    (2, 'salt', '1/2 teaspoon', FALSE),
    (2, 'egg', '1 piece', FALSE),
    (3, 'ground pork', '1 1/2 lbs', FALSE),
    (3, 'diced potatoes', '1 1/2 cups', FALSE),
    (3, 'diced carrots', '1 cup', FALSE),
    (3, 'tomato sauce', '8 oz', FALSE),
    (3, 'garlic', '6 cloves', FALSE),
    (3, 'minced onion', '1 medium-size', FALSE),
    (3, 'granulated sugar', '1 teaspoon', FALSE),
    (3, 'pork cube', '1 piece', FALSE),
    (3, 'boiled eggs', '4 pieces', TRUE),
    (3, 'salt and pepper to taste', '', FALSE),
    (3, 'cooking oil', '3 tablespoons', FALSE),
    (3, 'water', '1 cup', FALSE),
    (4, 'bone-in beef shanks', '3 lbs', FALSE),
    (4, 'cold water', '', FALSE),
    (4, 'quartered onion', '1 large', FALSE),
    (4, 'fish sauce', '2 tablespoons', FALSE),
    (4, 'peppercorn', '1 tablespoon', FALSE),
    (4, 'corn', '2 pieces', FALSE),
    (4, 'pechay', '1 bunch', FALSE),
    (4, 'green onion', '2 stalks', FALSE),
    (4, 'salt to taste', '', FALSE),
    (5, 'whole packer brisket', '12 to 14 lbs', FALSE),
    (5, 'coarse kosher salt', '2 tablespoons', FALSE),
    (5, 'coarse ground black pepper', '2 tablespoons', FALSE),
    (5, 'garlic powder', '2 tablespoons', TRUE);

-- Basic ingredient query by recipe name
SELECT * 
FROM ingredient i
JOIN recipe r ON r.recipe_id = i.recipe_id
WHERE r.recipe_name LIKE '%brisket%';

-- Table structure for table `direction`
CREATE TABLE IF NOT EXISTS public.direction (
    dir_id INT NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    dir_ins CHARACTER varying NOT NULL,
    recipe_id INT NOT NULL,
    CONSTRAINT direction_pk PRIMARY KEY (dir_id)
);

-- Create relationship between `recipe` and `direction` tables
ALTER TABLE IF EXISTS public.direction
    ADD CONSTRAINT fk_direction FOREIGN KEY (recipe_id)
    REFERENCES public.recipe (recipe_id) MATCH SIMPLE
    ON UPDATE CASCADE
	ON DELETE NO ACTION;

-- Data for table `direction`
INSERT INTO public.direction (
    recipe_id,
    dir_ins
)
VALUES 
    (1, 'Combine chicken, soy sauce, and garlic in a large bowl. Mix well. Marinate the chicken for at least 1 hour. Note: the longer the time, the better.'),
    (1, 'Heat a cooking pot. Pour cooking oil.'),
    (1, 'When the oil is hot enough, pan-fry the marinated chicken for 2 minutes per side.'),
    (1, 'Pour-in the remaining marinade, including garlic. Add water. Bring to a boil.'),
    (1, 'Add dried bay leaves and whole peppercorn. Simmer for 30 minutes or until the chicken gets tender.'),
    (1, 'Add vinegar. Stir and cook for 10 minutes.'),
    (1, 'Put-in the sugar, and salt. Stir and turn the heat off. Serve hot. Share and Enjoy!'),
    (2, 'Pour the water in a pan and bring to a boil Add salt and pepper.'),
    (2, 'Put-in the pig ears and pork belly then simmer for 40 minutes to 1 hour (or until tender).'),
    (2, 'Remove the boiled ingredients from the pot then drain excess water.'),
    (2, 'Grill the boiled pig ears and pork belly until done.'),
    (2, 'Chop the pig ears and pork belly into fine pieces.'),
    (2, 'In a wide pan, melt the butter or margarine. Add the onions. Cook until onions are soft.'),
    (2, 'Put-in the ginger and cook for 2 minutes.'),
    (2, 'Add the chicken liver. Crush the chicken liver while cooking it in the pan.'),
    (2, 'Add the chopped pig ears and pork belly. Cook for 10 to 12 minutes'),
    (2, 'Put-in the soy sauce, garlic powder, and chili. Mix well.'),
    (2, 'Add salt and pepper to taste.'),
    (2, 'Put-in the mayonnaise and mix with the other ingredients.'),
    (2, 'Transfer to a serving plate. Top with chopped green onions and raw egg.'),
    (2, 'Serve hot. Share and Enjoy (add the calamansi before eating).'),
    (3, 'Heat a cooking pot and pour-in the cooking oil.'),
    (3, 'When the oil is hot enough, put-in the garlic and sauté until the color turns light brown.'),
    (3, 'Add the onions and sauté until the texture becomes soft.'),
    (3, 'Put-in the ground pork and cook for 5 minutes.'),
    (3, 'Add the beef or pork cube, tomato sauce, and water and let boil. Simmer for 20 minutes.'),
    (3, 'Put the carrots and potatoes in then stir until every ingredient is properly distributed. Simmer for 10 to 12 minutes.'),
    (3, 'Add salt, ground black pepper, and sugar then stir.'),
    (3, 'Put in the boiled eggs and turn off the heat.'),
    (3, 'Transfer to a serving bowl and serve.'),
    (4, 'In a large pot, combine beef shanks and enough cold water to cover. Bring to a boil.'),
    (4, 'Drain beef and rinse under cold water to remove impurities. Discard the liquid and rinse the pot.'),
    (4, 'In the pot, return meat and enough cold water to cover. Bring to a boil, skimming scum that accumulates on top.'),
    (4, 'When the broth has cleared, add onions, fish sauce, and peppercorns.'),
    (4, 'Lower heat, cover, and cook at a bare simmer for about 1 ½ to 2 hours or until meat is fork-tender but not falling apart.'),
    (4, 'Add corn and simmer for 10 to 15 minutes or until corn is tender.'),
    (4, 'Add the pechay and green onions and cook for about 2 to 3 minutes or until vegetables are tender.'),
    (4, 'Season with salt to taste. Serve hot with fish sauce and calamansi.'),
    (5, 'Store your brisket in the refrigerator until you are ready to start trimming. Cold briskets are much easier to work with. Flip your brisket over so the point end is underneath. Remove any silver skin or excess fat from the flat muscle. Trim down the large crescent moon shaped fat section until it is a smooth transition between the point and the flat. Trim and excessive or loose meat and fat from the point. Square the edges and ends of the flat. Flip the brisket over and trim the top fat cap to about 1/4 of an inch thickness across the surface of the brisket.'),
    (5, 'In a mixing bowl or empty spice container, mix the salt, pepper, and garlic. Share over the brisket to evenly distribute the spices on all sides.'),
    (5, 'Preheat your smoker to 225 degrees F using indirect heat and hardwood smoke. Place the brisket on the smoker with the point end facing your main heat source. This is a thicker part of the brisket and it can handle the additional heat. Close the lid and smoke until and internal thermometer reads 165 degrees F (usually takes around 8 hours).'),
    (5, 'On a large work surface, roll out a big piece of butcher paper (or foil) and center your brisket in the middle. Wrap the brisket by folding edge over edge, creating a leak proof seal all the way around. Return the wrapped brisket to the smoker, seam side down so the weight from the brisket crimps the edges of the paper wrap down tight.'),
    (5, 'Close the lid on the smoker and, maintaining 225 degrees F, continue cooking until the internal temperature of the brisket reaches 202 degrees F in the thickest part of the meat (takes anywhere from 5-8 hours).'),
    (5, 'Remove the brisket to a large cutting board and allow to rest for 1 hour before slicing. Slice both the point and the flat against the grain with a sharp knife and serve immediately.');

-- Basic direction query by recipe name
SELECT * 
FROM direction d
JOIN recipe r ON r.recipe_id = d.recipe_id
WHERE r.recipe_name LIKE '%giniling%';