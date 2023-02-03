const { Router } = require('express');
const Users = require('../models/User');

const router = Router();

router.get('/api/users', async (req, res) => {
  const users = await Users.find();
  res.json({users})
  res.status(200)
}); 

router.get('/api/users/create/:id', async (req, res) => {
  const sizeID = req.params.id || '5';
  const size = Number(sizeID);

  if (Number.isNaN(size)) {
    res.sendStatus(400)
    res.json({
      error: "Param id must be a number"
    });
  }

  const users = await search(size);
  for (let i = 0; i < size; i++) {
    await Users.create({
      firstName: users[i].first_name,
      lastName: users[i].last_name,
      Avatar: users[i].avatar
    });
  }
  res.json({ message: `${size} user(s) created.` });
})

router.get('/', (req, res) => {
  res.json({ message: "Hello world" });
})

module.exports = router;

async function search(size) {
  const res = await fetch(`https://random-data-api.com/api/v2/users?size=${size}`).then((res) => res.json());
  return res;
}