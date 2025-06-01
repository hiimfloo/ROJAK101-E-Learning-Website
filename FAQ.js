window.addEventListener('DOMContentLoaded', () => {
    const buttons = document.querySelectorAll('.accordion-btn');

    buttons.forEach(button => {
        button.addEventListener('click', () => {
            const item = button.parentElement;
            const content = item.querySelector('.accordion-content');
            const arrow = button.querySelector('.arrow');

            // Close other open items
            document.querySelectorAll('.accordion-item').forEach(i => {
                if (i !== item) {
                    i.classList.remove('active');
                    i.querySelector('.accordion-content').style.maxHeight = null;
                    i.querySelector('.arrow').classList.remove('rotate');
                }
            });

            // Toggle current item
            if (item.classList.contains('active')) {
                item.classList.remove('active');
                content.style.maxHeight = null;
                arrow.classList.remove('rotate');
            } else {
                item.classList.add('active');
                content.style.maxHeight = content.scrollHeight + 'px';
                arrow.classList.add('rotate');
            }
        });
    });
});