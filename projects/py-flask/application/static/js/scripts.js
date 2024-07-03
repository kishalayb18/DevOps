document.addEventListener('DOMContentLoaded', () => {
    const nameForm = document.getElementById('nameForm');
    const nameInput = document.getElementById('nameInput');
    const messageDisplay = document.getElementById('message');
    const nameList = document.getElementById('nameList');
    const searchInput = document.getElementById('searchInput');
    const itemCount = document.getElementById('itemCount');
    const deleteSelectedButton = document.getElementById('deleteSelectedButton');
    const selectAllCheckbox = document.getElementById('selectAllCheckbox');

    if (nameForm) {
        nameForm.addEventListener('submit', function (event) {
            event.preventDefault();
            const name = nameInput.value.trim();
            if (name) {
                nameInput.value = ''; // Reset the input field value 
                nameInput.placeholder = 'Enter a name here'; // Reset the input field value 
                messageDisplay.innerHTML = `${name} is entered.`;
                saveName(name);
                        
            }
        });
    }

    if (nameList) {
        loadNames();
    }

    if (searchInput) {
        searchInput.addEventListener('input', function () {
            const filter = searchInput.value.toLowerCase();
            const items = nameList.getElementsByTagName('li');
            let count = 0;
            Array.from(items).forEach(item => {
                const text = item.textContent || item.innerText;
                if (text.toLowerCase().indexOf(filter) > -1) {
                    item.style.display = '';
                    count++;
                } else {
                    item.style.display = 'none';
                }
            });
            updateItemCount(count);
        });
    }

    if (deleteSelectedButton) {
        deleteSelectedButton.addEventListener('click', function () {
            const visibleItems = nameList.querySelectorAll('li:not([style*="display: none"]) input[type="checkbox"]:checked');
            visibleItems.forEach(checkbox => {
                const li = checkbox.closest('li');
                const name = li.querySelector('span').textContent;
                li.remove();
                removeName(name);
            });
            updateItemCount();
        });
    }

    if (selectAllCheckbox) {
        selectAllCheckbox.addEventListener('change', function () {
            const checkboxes = nameList.querySelectorAll('li:not([style*="display: none"]) input[type="checkbox"]');
            checkboxes.forEach(checkbox => {
                checkbox.checked = selectAllCheckbox.checked;
            });
        });
    }

    function saveName(name) {
        let names = JSON.parse(localStorage.getItem('names')) || [];
        names.push(name);
        localStorage.setItem('names', JSON.stringify(names));
        addNameToList(name);
        updateItemCount();
    }

    function loadNames() {
        let names = JSON.parse(localStorage.getItem('names')) || [];
        names.forEach(name => addNameToList(name));
        updateItemCount();
    }

    function addNameToList(name) {
        const li = document.createElement('li');
        const checkbox = document.createElement('input');
        checkbox.type = 'checkbox';
        const span = document.createElement('span');
        span.textContent = name;
        const deleteButton = document.createElement('button');
        deleteButton.textContent = 'Delete';
        deleteButton.addEventListener('click', function () {
            li.remove();
            removeName(name);
            updateItemCount();
        });

        li.appendChild(checkbox);
        li.appendChild(span);
        li.appendChild(deleteButton);
        nameList.appendChild(li);
    }

    function removeName(name) {
        let names = JSON.parse(localStorage.getItem('names')) || [];
        names = names.filter(n => n !== name);
        localStorage.setItem('names', JSON.stringify(names));
    }

    function updateItemCount(count) {
        const items = nameList.getElementsByTagName('li');
        const visibleItems = count !== undefined ? count : Array.from(items).filter(item => item.style.display !== 'none').length;
        itemCount.textContent = `${visibleItems} result${visibleItems !== 1 ? 's' : ''} found`;
    }
});