function togglemenu() {
    var menu = document.getElementById("menu");
    var list = document.getElementById("nav");
    if (list.style.display === "none") {
        menu.style.backgroundColor = "rgba(61, 61, 70, .2)";
        list.style.display = "flex";
    } else {
        list.style.display = "none";
        menu.style.backgroundColor = "#fff";
    }
}

const loginModal = document.getElementById("loginModal");
const loginButton = document.querySelector(".login");

loginButton.addEventListener("click", () => {
    loginModal.style.display = "flex";
});

function closeModal() {
    loginModal.style.display = "none";
}


