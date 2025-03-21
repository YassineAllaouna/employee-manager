let token = ""

function login() {
  const email = document.getElementById('email').value
  const password = document.getElementById('password').value

  fetch('http://localhost:3000/login', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ email, password })
  })
  .then(res => res.json())
  .then(data => {
    token = data.token
    loadEmployees()
  })
  .catch(err => console.error('Erreur login:', err))
}

function loadEmployees() {
  fetch('http://localhost:3000/employees', {
    headers: { 'Authorization': 'Bearer ' + token }
  })
  .then(res => res.json())
  .then(data => {
    const list = document.getElementById('employees')
    list.innerHTML = ''
    data.forEach(emp => {
      const item = document.createElement('li')
      item.innerText = `${emp.name} - ${emp.position} (${emp.department})`
      list.appendChild(item)
    })
  })
  .catch(err => console.error('Erreur load:', err))
}

function addEmployee() {
  const name = document.getElementById('name').value
  const position = document.getElementById('position').value
  const department = document.getElementById('department').value

  fetch('http://localhost:3000/employees', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token
    },
    body: JSON.stringify({ employee: { name, position, department } })
  })
  .then(() => loadEmployees())
  .catch(err => console.error('Erreur ajout:', err))
}