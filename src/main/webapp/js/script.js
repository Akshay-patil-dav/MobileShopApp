/* ============================================
   MobileHub - JavaScript
   ============================================ */

document.addEventListener('DOMContentLoaded', function () {

    // ============= Admin Sidebar Toggle =============
    const sidebarToggle = document.getElementById('sidebarToggle');
    const sidebar = document.getElementById('adminSidebar');
    if (sidebarToggle && sidebar) {
        sidebarToggle.addEventListener('click', function () {
            sidebar.classList.toggle('show');
        });
    }

    // ============= Form Validation =============
    const loginForm = document.getElementById('loginForm');
    if (loginForm) {
        loginForm.addEventListener('submit', function (e) {
            const email = loginForm.querySelector('[name="email"]');
            const password = loginForm.querySelector('[name="password"]');
            if (email && !email.value.trim()) {
                e.preventDefault();
                alert('Please enter your email.');
                email.focus();
                return;
            }
            if (password && !password.value.trim()) {
                e.preventDefault();
                alert('Please enter your password.');
                password.focus();
                return;
            }
        });
    }

    const registerForm = document.getElementById('registerForm');
    if (registerForm) {
        registerForm.addEventListener('submit', function (e) {
            const name = registerForm.querySelector('[name="name"]');
            const email = registerForm.querySelector('[name="email"]');
            const phone = registerForm.querySelector('[name="phone"]');
            const password = registerForm.querySelector('[name="password"]');

            if (name && !name.value.trim()) {
                e.preventDefault();
                alert('Please enter your name.');
                name.focus();
                return;
            }
            if (email && !email.value.trim()) {
                e.preventDefault();
                alert('Please enter your email.');
                email.focus();
                return;
            }
            if (phone && !phone.value.trim()) {
                e.preventDefault();
                alert('Please enter your phone number.');
                phone.focus();
                return;
            }
            if (password && password.value.length < 6) {
                e.preventDefault();
                alert('Password must be at least 6 characters.');
                password.focus();
                return;
            }
        });
    }

    // ============= Smooth Scroll =============
    document.querySelectorAll('a[href^="#"]').forEach(function (anchor) {
        anchor.addEventListener('click', function (e) {
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                e.preventDefault();
                target.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        });
    });

    // ============= Navbar Scroll Effect =============
    const navbar = document.querySelector('.main-nav');
    if (navbar) {
        window.addEventListener('scroll', function () {
            if (window.scrollY > 50) {
                navbar.style.boxShadow = '0 4px 30px rgba(0, 0, 0, 0.4)';
            } else {
                navbar.style.boxShadow = '0 4px 20px rgba(0, 0, 0, 0.3)';
            }
        });
    }

    // ============= Confirm Delete =============
    document.querySelectorAll('[data-confirm]').forEach(function (el) {
        el.addEventListener('click', function (e) {
            if (!confirm(this.getAttribute('data-confirm'))) {
                e.preventDefault();
            }
        });
    });

    // ============= Auto-dismiss Alerts =============
    document.querySelectorAll('.alert').forEach(function (alert) {
        setTimeout(function () {
            alert.style.transition = 'opacity 0.5s';
            alert.style.opacity = '0';
            setTimeout(function () { alert.remove(); }, 500);
        }, 5000);
    });
});
