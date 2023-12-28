function tagsVisibility() {
    const buttonItems = document.querySelector('.TagSection.Items')
    const tagListItems = document.querySelector('.TagList.Items')
    const arrowItems = document.querySelector('.IconArrowDown.Items')
    const buttonTech = document.querySelector('.TagSection.Tech')
    const tagListTech = document.querySelector('.TagList.Tech')
    const arrowTech = document.querySelector('.IconArrowDown.Tech')
    const buttonMat = document.querySelector('.TagSection.Mat')
    const tagListMat = document.querySelector('.TagList.Mat')
    const arrowMat = document.querySelector('.IconArrowDown.Mat')


    buttonItems.addEventListener('click', (e) => {
        e.stopPropagation();
        tagListItems.classList.toggle('show')
        arrowItems.classList.toggle('CD')
    })

    buttonTech.addEventListener('click', (e) => {
        e.stopPropagation();
        tagListTech.classList.toggle('show')
        arrowTech.classList.toggle('CD')
    })

    buttonMat.addEventListener('click', (e) => {
        e.stopPropagation();
        tagListMat.classList.toggle('show')
        arrowMat.classList.toggle('CD')
    })

    document.addEventListener( 'click', (e) => {
        const target = e.target

        const ItagList = target == tagListItems || tagListItems.contains(target)
        const ItagButton = target == buttonItems
        const ItagListShow = tagListItems.classList.contains('show')
        const Iarrow = arrowItems.classList.contains('CD')

        const TtagList = target == tagListTech || tagListTech.contains(target)
        const TtagButton = target == buttonTech
        const TtagListShow = tagListTech.classList.contains('show')
        const Tarrow = arrowTech.classList.contains('CD')

        const MtagList = target == tagListMat || tagListMat.contains(target)
        const MtagButton = target == buttonMat
        const MtagListShow = tagListMat.classList.contains('show')
        const Marrow = arrowMat.classList.contains('CD')

        if ( ( !ItagList && !ItagButton && ItagListShow && Iarrow ) || ( !TtagList && !TtagButton && TtagListShow && Tarrow) || ( !MtagList && !MtagButton && MtagListShow && Marrow) )  {
            tagListItems.classList.remove('show')
            arrowItems.classList.remove('CD')
            tagListTech.classList.remove('show')
            arrowTech.classList.remove('CD')
            tagListMat.classList.remove('show')
            arrowMat.classList.remove('CD')
        }
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