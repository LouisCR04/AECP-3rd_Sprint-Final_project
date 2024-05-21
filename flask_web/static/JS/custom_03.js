document.getElementById('addCountyForm').addEventListener('submit', function(event) {
    event.preventDefault();

    const countyName = document.getElementById('name').value;

    const data = {
        name: countyName
    };

    fetch('http://localhost:5001/api/v1/counties', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => {
        if (!response.ok) {
            return response.json().then(errorInfo => Promise.reject(errorInfo));
        }
        return response.json();
    })
    .then(data => {
        alert('County added successfully!');
        console.log(data);
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Failed to add county: ' + (error.description || 'Unknown error'));
    });
});
