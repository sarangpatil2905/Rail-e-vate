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
function showStep(stepNumber) {
    // Hide all step contents and show the selected step
    document.querySelectorAll('.stepContent').forEach((step) => {
        step.style.display = 'none'; // Hide all step contents initially
    });
    document.getElementById(`step${stepNumber}`).style.display = 'flex'; // Show the selected step content

    // Update progress bar to reflect the current step
    document.querySelectorAll('.progress-step').forEach((step, index) => {
        const stepIndex = index + 1;
        if (stepIndex < stepNumber) {
            step.classList.add('completed');
            step.style.backgroundColor = '#333E9A';
            step.style.color = 'white';
            step.querySelector('.step-circle').innerHTML = '&check;';
        } else if (stepIndex === stepNumber) {
            step.classList.remove('completed');
            step.style.backgroundColor = '#6675D0';
            step.style.color = 'white';
            step.querySelector('.step-circle').innerHTML = '&HorizontalLine;';
        } else {
            step.classList.remove('completed');
            step.style.backgroundColor = '#F0EEFF';
            step.style.color = '#6675D0';

            step.querySelector('.step-circle').innerHTML = '&times;';
        }
    });
}

function submitTicketDetails() {
    // Mark fields as completed and update their appearance
    document.querySelectorAll('.progress-step').forEach((field) => {
        field.classList.add('completed');
        field.style.backgroundColor = '#333E9A';
        field.style.color = 'white';

        // Add checkmark to the inner content of the step
        field.innerHTML = '&check;';
    });

    // Use a timeout to delay the alert until the elements have turned green
    setTimeout(() => {
        alert("Ticket booked successfully!");
    }, 200); // Adjust the delay as needed (500ms here ensures the user sees the visual change)
}
