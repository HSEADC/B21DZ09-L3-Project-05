function searchVisibility() {
  const searchFakeBtn = document.querySelector('.Q_Icon.Search.NavDesk.Fake')
  const searchRealBtn = document.querySelector('.Q_Icon.Search.NavDesk.Real')
  const serachInput = document.querySelector('.W_SearchHidden')

  searchFakeBtn.addEventListener('click', () => {
    serachInput.classList.add('active')
    searchRealBtn.classList.add('show')
    searchFakeBtn.classList.remove('show')
  })
}

function tagsVisibility() {
  const buttonItems = document.querySelector('.M_FilterSelect.Items')
  const tagListItems = document.querySelector('.M_FilterSelectDropdown.Items')
  const crossItems = document.querySelector('.Q_Icon.Cross.Items')
  const buttonTech = document.querySelector('.M_FilterSelect.Tech')
  const tagListTech = document.querySelector('.M_FilterSelectDropdown.Tech')
  const crossTech = document.querySelector('.Q_Icon.Cross.Tech')
  const buttonMat = document.querySelector('.M_FilterSelect.Mat')
  const tagListMat = document.querySelector('.M_FilterSelectDropdown.Mat')
  const crossMat = document.querySelector('.Q_Icon.Cross.Mat')

  buttonItems.addEventListener('click', (e) => {
    e.stopPropagation()
    tagListItems.classList.toggle('show')
  })

  buttonTech.addEventListener('click', (e) => {
    e.stopPropagation()
    tagListTech.classList.toggle('show')
  })

  buttonMat.addEventListener('click', (e) => {
    e.stopPropagation()
    tagListMat.classList.toggle('show')
  })

  document.addEventListener('click', (e) => {
    const target = e.target

    const ItagList = target == tagListItems || tagListItems.contains(target)
    const ItagButton = target == buttonItems
    const ItagListShow = tagListItems.classList.contains('show')

    const TtagList = target == tagListTech || tagListTech.contains(target)
    const TtagButton = target == buttonTech
    const TtagListShow = tagListTech.classList.contains('show')

    const MtagList = target == tagListMat || tagListMat.contains(target)
    const MtagButton = target == buttonMat
    const MtagListShow = tagListMat.classList.contains('show')

    if (
      (!ItagList && !ItagButton && ItagListShow) ||
      (!TtagList && !TtagButton && TtagListShow) ||
      (!MtagList && !MtagButton && MtagListShow)
    ) {
      tagListItems.classList.remove('show')
      tagListTech.classList.remove('show')
      tagListMat.classList.remove('show')
    }
  })
}

function addLike() {
  const like = document.querySelector('.Q_Icon.Like')

  like.addEventListener('click', () => {
    like.classList.toggle('active')
  })
}

function postOptionVisibility() {
  const button = document.querySelector('.Q_Icon.Options')
  const menu = document.querySelector('.M_PostOptions')

  button.addEventListener('click', () => {
    menu.classList.toggle('show')
  })

  document.addEventListener('click', (e) => {
    const target = e.target

    const menuA = target == menu || menu.contains(target)
    const buttonA = target == button
    const menuShow = menu.classList.contains('show')

    if (!menuA && !buttonA && menuShow) {
      menu.classList.remove('show')
    }
  })
}

function createNewPostVisibility() {
  const button = document.querySelector('.A_NavigationButton.NewPost')
  const menu = document.querySelector('.M_NavCreateNewPosts')

  if (button) {
    button.addEventListener('click', () => {
      menu.classList.toggle('show')
    })

    document.addEventListener('click', (e) => {
      const target = e.target

      const menuA = target == menu || menu.contains(target)
      const buttonA = target == button
      const menuShow = menu.classList.contains('show')

      if (!menuA && !buttonA && menuShow) {
        menu.classList.remove('show')
      }
    })
  }
}

function mobileMenuVisibility() {
  const button = document.querySelector('.Q_Icon.MenuMob')
  const menu = document.querySelector('.M_MobileMenu')

  button.addEventListener('click', () => {
    menu.classList.toggle('show')
  })

  document.addEventListener('click', (e) => {
    const target = e.target

    const menuA = target == menu || menu.contains(target)
    const buttonA = target == button
    const menuShow = menu.classList.contains('show')

    if (!menuA && !buttonA && menuShow) {
      menu.classList.remove('show')
    }
  })
}

function addIdeaToTutorial() {
  let numberOfExistingIdeas = document.getElementsByClassName(
    'O_IdeaCard forTutorial'
  ).length
  const ideasAndCardInRow = document.querySelector('.IdeaPostPageSeeAlso.inRow')
  const ideasAndAbsoluteCard = document.querySelector(
    '.IdeaPostPageSeeAlso.rowWhisAbsl'
  )
  // const mobIdeaCard = document.querySelector('.W_CardAddContentAbsolute')
  console.log(numberOfExistingIdeas)

  if (document.querySelector('.IdeaPostPageSeeAlsoCards.rowWhisAbsl')) {
    document
      .querySelector('.IdeaPostPageSeeAlsoCards.rowWhisAbsl')
      .lastElementChild.classList.add('addMargin')
  }

  if (document.querySelector('.IdeaPostPageSeeAlso')) {
    if (window.innerWidth >= 1441) {
      console.log('экран >=  1441')
      if (numberOfExistingIdeas >= 4) {
        ideasAndAbsoluteCard.classList.add('show')
      } else {
        ideasAndCardInRow.classList.add('show')
      }
    } else if (window.innerWidth >= 1281 && window.innerWidth <= 1440) {
      console.log('экран 1281-1440')
      if (numberOfExistingIdeas >= 3) {
        ideasAndAbsoluteCard.classList.add('show')
      } else {
        ideasAndCardInRow.classList.add('show')
      }
    } else if (window.innerWidth >= 768 && window.innerWidth <= 1280) {
      console.log('экран 768-1280')
      if (numberOfExistingIdeas >= 2) {
        ideasAndAbsoluteCard.classList.add('show')
      } else {
        ideasAndCardInRow.classList.add('show')
      }
    } else if (window.innerWidth <= 767) {
      console.log('экран <= 767')
      ideasAndAbsoluteCard.classList.add('show')
    }
  }
}

document.addEventListener('turbo:load', () => {
  if (document.body.classList.contains('tutorials_page')) {
    tagsVisibility()
    addLike()
  }

  if (document.body.classList.contains('ideas_page')) {
    addLike()
  }

  if (document.body.classList.contains('post_page')) {
    postOptionVisibility()
    addLike()
    addIdeaToTutorial()
  }

  mobileMenuVisibility()
  createNewPostVisibility()
  searchVisibility()
})
