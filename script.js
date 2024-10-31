// Toggle Menu
function toggleMenu() {
    const menuIcon = document.getElementById("menu-icon");
    const navList = document.getElementById("nav-list");

    if (navList.style.display === "none") {
        menuIcon.style.backgroundColor = "rgba(61, 61, 70, 0.2)";
        navList.style.display = "flex";
    } else {
        navList.style.display = "none";
        menuIcon.style.backgroundColor = "#fff";
    }
}

// Login Modal
const loginModal = document.getElementById("login-modal");
const loginButton = document.querySelector(".login-btn");

loginButton.addEventListener("click", () => {
    loginModal.style.display = "flex";
});

// Toggle Signin and Signup Sections
const signupToggleButton = document.getElementById("signup-toggle-btn");
const signinToggleButton = document.getElementById("signin-back-toggle");
const signinSection = document.getElementById("signin-section");
const signupSection = document.getElementById("signup-section");

signinToggleButton.addEventListener("click", () => {
    if (signinSection.style.display === "none") {
        signinSection.style.display = "flex";
        signupSection.style.display = "none";
    }
});

signupToggleButton.addEventListener("click", () => {
    if (signupSection.style.display === "none") {
        signupSection.style.display = "flex";
        signinSection.style.display = "none";
    }
});

// Close Modal
function closeLoginModal() {
    loginModal.style.display = "none";
}
