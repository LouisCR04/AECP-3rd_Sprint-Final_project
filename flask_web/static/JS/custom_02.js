function showDropdown(countyName) {
    event.preventDefault();
    var dropdownId = 'dropdown-' + countyName; // Generate unique dropdown ID
    var dropdown = document.getElementById(dropdownId);

    // Hide all dropdowns first to ensure only the clicked one is visible
    var allDropdowns = document.querySelectorAll('[id^="dropdown-"]');
    allDropdowns.forEach(function(element) {
        element.style.display = 'none';
    });

    if (dropdown.style.display === 'none') {
        dropdown.style.display = 'block';
    } else {
        dropdown.style.display = 'none';
    }
}
