document.getElementById('addChurchForm').addEventListener('submit', function(event) {
    event.preventDefault();

    const churchName = document.getElementById('name').value;

    const data = {
        name: churchName
    };

    console.log(subcountyId);
    fetch(`http://localhost:5001/api/v1/subcounties/${subcountyId}/churches`, {
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
        alert('Church added successfully!');
        console.log(data);
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Failed to add county: ' + (error.description || 'Unknown error'));
    });
});
