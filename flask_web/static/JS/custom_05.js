document.getElementById('addTransactionForm').addEventListener('submit', function(event) {
    event.preventDefault();

    const financeType = document.getElementById('financeType').value;
    const amount = document.getElementById('amount').value;
    const dated = document.getElementById('dated').value;

    const data = {
        finance_type: financeType,
        amount: amount,
        dated: dated
    };

    fetch(`http://localhost:5001/api/v1/churches/${churchId}/infinances`, {
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
        alert('Transaction added successfully!');
        console.log(data);
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Failed to add county: ' + (error.description || 'Unknown error'));
    });
});
