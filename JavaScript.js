let slideIndex = 0;
showSlides();

function showSlides() {
    let i;
    const slides = document.getElementsByClassName("slide");
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    slides[slideIndex-1].style.display = "block";  
    setTimeout(showSlides, 3000); // Change image every 3 seconds
}

function changeSlide(n) {
    const slides = document.getElementsByClassName("slide");
    slideIndex += n;
    if (slideIndex > slides.length) {slideIndex = 1}    
    if (slideIndex < 1) {slideIndex = slides.length}
    for (let i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";  
    }
    slides[slideIndex-1].style.display = "block";
}

/* Modal handling */
const modal = document.getElementById("imageModal");
const modalImg = document.getElementById("modalImage");
let modalSlideIndex = 0;

document.querySelectorAll('.slide').forEach((item, index) => {
    item.addEventListener('click', () => {
        modal.style.display = "block";
        modalImg.src = item.src;
        modalSlideIndex = index;
    });
});

/* Close modal when clicking outside image */
modal.addEventListener('click', function(event) {
    if (event.target === modal) {
        modal.style.display = "none";
    }
});

function closeModal() {
    modal.style.display = "none";
}

function changeModalSlide(n) {
    const slides = document.getElementsByClassName("slide");
    modalSlideIndex += n;
    if (modalSlideIndex >= slides.length) {modalSlideIndex = 0}
    if (modalSlideIndex < 0) {modalSlideIndex = slides.length - 1}
    modalImg.src = slides[modalSlideIndex].src;
}

document.querySelector('.modal-prev').addEventListener('click', () => changeModalSlide(-1));
document.querySelector('.modal-next').addEventListener('click', () => changeModalSlide(1));
