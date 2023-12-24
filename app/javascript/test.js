function tagsVisibility() {
    const button = document.querySelector('.testItemButton')
    const menu = document.querySelector('.testItem')
  
    button.addEventListener('click', () => {
      menu.classList.toggle('show')
    })
}

function menubarVisibility() {
    const button = document.querySelector('.testItemButton')
    const menu = document.querySelector('.testItem')
  
    button.addEventListener('click', () => {
      menu.classList.toggle('show')
    })
}

document.addEventListener('DOMContentLoaded', () => {
    if (document.body.classList.contains('posts_page')) {
        tagsVisibility()
    }
    menubarVisibility()
  })