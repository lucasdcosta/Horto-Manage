/*=============== MOSTRAR MENU ===============*/
const navMenu = document.getElementById('nav-menu'),
      navToggle = document.getElementById('nav-toggle'),
      navClose = document.getElementById('nav-close')

/* mostrar Menu */
if(navToggle){
    navToggle.addEventListener('click', () =>{
        navMenu.classList.add('show-menu')
    })
}

/* Esconder Menu */
if(navClose){
    navClose.addEventListener('click', () =>{
        navMenu.classList.remove('show-menu')
    })
}

/*=============== REMOVER MENU MOBILE ===============*/
const navLink = document.querySelectorAll('.nav__link')

const linkAction = () =>{
    const navMenu = document.getElementById('nav-menu')
    // Quando clicamos no nav__link, removemos a classe show menu
    navMenu.classList.remove('show-menu')
}
navLink.forEach(n => n.addEventListener('click', linkAction))

/*=============== ADD BLUR TO HEADER ===============*/

const blurHeader = () =>{
    const header = document.getElementById('header')
    this.scrollY >= 50 ? header.classList.add('blur-header') 
                       : header.classList.remove('blur-header')
}
window.addEventListener('scroll', blurHeader)

/*=============== EMAIL JS ===============*/
const contactForm = document.getElementById('contact-form'),
        contactMessage = document.getElementById('contact-message')

        const sendEmail = (e) =>{
            e.preventDefault()

            //serviceID - templateID - #form - publicKey
            emailjs.sendForm('service_ewt40am', 'template_0zhndgj', '#contact-form', 'USAhYnlXKHaB4rs5G')
                .then(() =>{
                    //Mostrar mensagem enviada
                    contactMessage.textContent = 'Mensagem enviada com sucesso ✅'

                    //Remover mensagem após 5 segundos
                    setTimeout(() =>{
                        contactMessage.textContent = ''
                    }, 5000)

                    //Limpar inputs
                    contactForm.reset()
                }, () =>{
                    //Mostrar mensagem de erro
                    contactMessage.textContent = 'Mensagem não enviada (erro) ❌'
                })
        }

        contactForm.addEventListener('submit', sendEmail)
/*=============== SHOW SCROLL UP ===============*/ 
const scrollUp = () =>{
    const scrollUp = document.getElementById('scroll-up')
    //quando o scroll tiver um viewport maior que 350, adiciona o show-scroll como classe para a tag scrollup
    this.scrollY >= 350 ? scrollUp.classList.add('show-scroll')
                    :  scrollUp.classList.remove('show-scroll')
}
window.addEventListener('scroll', scrollUp)

/*=============== SCROLL SECTIONS ACTIVE LINK ===============*/
const sections = document.querySelectorAll('section[Id]')


const scrollActive = () =>{
    const scrollY = window.pageYoffset

    sections.forEach(current =>{
        const sectionHeigt = current.offsetHeight,
        sectionTop = current.offsetTop - 58,
        sectionId = current.getAttribute('id'),
        sectionsClass = document.querySelector('.nav_menu a[href*=' + sectioonId + ']')

        if(scrollY > sectionTop && scrollY <= sectionTop + sectionHeight){
            sectionsClass.classList.add('active-link')
        }else{
            sectionsClass.classList.remove('active-link')
        }
    })
}
window.addEventListener('scroll', scrollActive)

