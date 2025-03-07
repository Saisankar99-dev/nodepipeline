// Fetch data from the backend API
fetch('/api')
  .then((response) => response.text())
  .then((data) => {
    document.getElementById('backend-message').innerText = `Backend says: ${data}`;
  });