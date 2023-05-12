const $main_nav = document.getElementById('main-nav'),
      $products = document.getElementById('products'),
      $products_title = document.getElementById('products-title'),
      $template_product = document.getElementById('product-template').content,
      $fragment = document.createDocumentFragment(),
      $cart = document.querySelector('.header__cart'),
      $icon_menu = document.getElementById('icon-menu');

// Url por defecto para solicitar los productos destacados
let url = '../../api/controllers/products.php';

// Crear un array para almacenar en los productos que se agregan al carrito de compras
let products = JSON.parse(localStorage.getItem('products'));
if (products === null) {
  products = new Array();
  localStorage.setItem('products', JSON.stringify(products));
  // Actualizar el contador de productos del carrito
  document.querySelector('.header__cart-count').textContent = 0;
} else {
  document.querySelector('.header__cart-count').textContent = JSON.parse(localStorage.products).length;
}

// Al cargar el documento se ejecutan los fetch para armar el menú y para mostrar los destacados en el home
document.addEventListener('DOMContentLoaded', (e) => {

  // Función para crear un item en el submenu (ul>-i>a)
  const createSubcategoryItem = (i, json, submenu) => {
    let submenu_item = document.createElement('li');
    submenu_item.classList.add('submenu__item');

    let submenu_link = document.createElement('a');
    submenu_link.classList.add('submenu__link');
    submenu_link.id = json[i].idSub;
    submenu_link.href = `../../api/controllers/products.php?subcategory=${ parseInt(json[i].idSub) }`;
    submenu_link.textContent = json[i].Subcategory;

    submenu_item.appendChild(submenu_link);
    submenu.appendChild(submenu_item);
  }

  // Arma el menú dinámico de categorías y subcategorías
  fetch('../../api/controllers/menu.php')
    .then((res) => (res.ok ? res.json() : Promise.reject(res)))
    .then((json) => {
      let i = 0;
      const menu = document.createElement('ul');
      menu.classList.add('menu');
      menu.id = 'menu';
      // Recorrer el array mientras el indice i sea menor que la cantidad de elementos
      while (i < json.length) {
        let category_prev = parseInt(json[i].idCat);
        let menu_item = document.createElement('li');
        menu_item.classList.add('menu__item');

        let menu_link = document.createElement('a');
        menu_link.classList.add('menu__link');
        menu_link.id = json[i].idCat;
        menu_link.href = `../../api/controllers/products.php?category=${ parseInt(json[i].idCat) }`;
        menu_link.textContent = `${json[i].Category} `;

        let menu_icon = document.createElement('i');
        menu_icon.classList.add('fas', 'fa-chevron-down');
        menu_icon.title = 'Desplegar categoría';

        let submenu = document.createElement('ul');
        submenu.classList.add('submenu');

        menu_item.appendChild(menu_link);
        menu_item.appendChild(menu_icon);
        menu_item.appendChild(submenu);

        while (i < json.length && parseInt(json[i].idCat) === category_prev) {
          createSubcategoryItem(i, json, submenu);
          category_prev = parseInt(json[i].idCat);
          i++;
        }
        menu.appendChild(menu_item);
      }
      $main_nav.appendChild(menu);
    })
    .catch((err) => {
      console.log(err)
      let message = err.statusText || "Ocurrió un error";
      // $message.innerHTML = `Error ${ err.status }: ${ message }`;
      console.log(`Error ${ err.status }: ${ message }`);
    })
    .finally(() => {
      // console.log("Esto se ejecuta independientemente del resultado de la Promesa Fetch");
  })

  // Solicita los productos destacados para mostrar en el home
  fetch(url)
  .then((res) => (res.ok ? res.json() : Promise.reject(res)))
  .then((json) => {
    json.forEach(item => {
      $template_product.querySelector('img').setAttribute('src', `assets/images/${item.id}.jpg`);
      $template_product.querySelector('img').setAttribute('alt', item.name);
      $template_product.querySelector('img').setAttribute('title', item.name);
      $template_product.querySelector('h4').textContent = item.name;
      $template_product.querySelector('p').textContent = item.description;
      $template_product.querySelector('span').textContent = item.price ? item.price : 'SIN VALOR';
      $template_product.querySelector('button').setAttribute('id', item.id);
      // $template_product.querySelector('button').setAttribute('title', `Agregar ${item.name} al carrito`);
      let $clone = document.importNode($template_product, true);
      $fragment.appendChild($clone);
    })
    $products_title.textContent = 'Productos Destacados';
    $products.appendChild($fragment);
  })
  .then(() => {
    const products_list = Array.from(document.querySelectorAll('.product'));
    for (let i = 0; i < products_list.length; i++) {
      let button = products_list[i].querySelector('button');
      if (products.find(product => product.id === button.id)) {
        button.classList.add('product__cart--remove');
        // button.setAttribute('disabled', 'disabled');
      } else {
        button.classList.remove('product__cart--remove');
        // button.removeAttribute('disabled');
      }
      let product = {};
      button.addEventListener('click', (e) => {
        e.preventDefault();
        const index = products.findIndex(product => product.id === button.id);
        if (index !== -1) {
          products.splice(index, 1);
          localStorage.setItem('products', JSON.stringify(products));
          button.classList.toggle('product__cart--remove');
        } else {
          product.id = button.id;
          product.name = button.parentElement.previousElementSibling.previousElementSibling.textContent;
          product.price = button.previousElementSibling.textContent;
          products.push(product);
          localStorage.setItem('products', JSON.stringify(products));
          button.classList.toggle('product__cart--remove');
          // button.setAttribute('disabled', 'disabled');
        }

        // Actualizar el contador de productos del carrito
        document.querySelector('.header__cart-count').textContent = JSON.parse(localStorage.products).length;
      });
    }

  })
  .catch((err) => {
    console.log(err)
    let message = err.statusText || "Ocurrió un error";
    // $message.innerHTML = `Error ${ err.status }: ${ message }`;
    console.log(`Error ${ err.status }: ${ message }`);
  })
  .finally(() => {
    // console.log("Esto se ejecuta independientemente del resultado de la Promesa Fetch");
  })
})

// Función para cambiar el icono del menú (hamburguesa/cruz)
const toogleIcon = (icon) => {
  if (icon.querySelector('.fa-times')) {
    icon.querySelector('.fa-times').classList.remove('fa-times');
    icon.children[0].classList.add('fa-bars');
  } else {
    icon.querySelector('.fa-bars').classList.remove('fa-bars');
    icon.children[0].classList.add('fa-times');
  }
}

// Al hacer click en el icono del menú
  // Hamburguesa -> muestra el menú
  // Cruz -> cierra el menú
$icon_menu.addEventListener('click', (e) => {
  if (window.innerWidth < 768) {
    $main_nav.classList.toggle('visible');
    toogleIcon($icon_menu);
  }
})

// Al hacer click en una categoría o una subcategoría del menú
$main_nav.addEventListener('click', (e) => {
  e.preventDefault();
    if (e.target.classList.contains('menu__link')) {
    url = `../../api/controllers/products.php?category=${e.target.id}`;
  } else if (e.target.classList.contains('submenu__link')) {
    url = `../../api/controllers/products.php?subcategory=${e.target.id}`;
  } else if (e.target.classList.contains('fa-chevron-down')) {
    const $current_submenu = e.target.nextElementSibling;
    const $alls_submenu = $main_nav.querySelectorAll('.submenu')
    $alls_submenu.forEach(sub => {
      sub.classList.remove('show-submenu');
    })
    $current_submenu.classList.add('show-submenu');
    url = '';
  }
  if ((window.innerWidth < 768 && e.target.classList.contains('menu__link')) || (window.innerWidth < 768 && e.target.classList.contains('submenu__link'))) {
    $main_nav.classList.toggle('visible');
    toogleIcon($icon_menu);
  }
  // Expresion regular para saber si el parámetro de la url es una categoría o una subcategoría
  const regex = /([a-z.\/:]+)(\?)([a-z]+)(=[0-9]+)/gm;
  const subst = `$3`;
  const param = url.replace(regex, subst);
  // Ejecutar el fetc solo si existe un parametro (categoría o subcategoría)
  if (param !== url) {
  fetch(url)
    .then((res) => (res.ok ? res.json() : Promise.reject(res)))
    .then((json) => {
      json.forEach(item => { //Se recorre el arreglo de objetos json
        $template_product.querySelector('img').setAttribute('src', `assets/images/${item.id}.jpg`);
        $template_product.querySelector('img').setAttribute('alt', item.name);
        $template_product.querySelector('img').setAttribute('title', item.name);
        $template_product.querySelector('h4').textContent = item.name;
        $template_product.querySelector('p').textContent = item.description;
        $template_product.querySelector('span').textContent = item.price ? item.price : 'SIN VALOR';
        $template_product.querySelector('button').setAttribute('id', item.id);
        $template_product.querySelector('button').classList.remove('product__cart--remove');
        let $clone = document.importNode($template_product, true);
        $fragment.appendChild($clone);
      })

      switch (param) {
        case 'category':
          $products_title.textContent = `${json[0].Category}`;
          break;
        case 'subcategory':
          $products_title.textContent = (json.length > 0) ? `${json[0].Category} / ${json[0].Subcategory}` : `No existen productos en esta subcategoría`;
          break;
        default:
          break;
      }
      $products.innerHTML = '';
      $products.appendChild($fragment);
    })
    .then(() => {
      const products_list = Array.from(document.querySelectorAll('.product'));
      for (let i = 0; i < products_list.length; i++) {
        let button = products_list[i].querySelector('button');
        if (products.find(product => product.id === button.id)) {
          button.classList.add('product__cart--remove');
          // button.setAttribute('disabled', 'disabled');
        } else {
          button.classList.remove('product__cart--remove');
          // button.removeAttribute('disabled');
        }
        let product = {};
        button.addEventListener('click', (e) => {
          e.preventDefault();
          const index = products.findIndex(product => product.id === button.id);
          if (index !== -1) {
            products.splice(index, 1);
            localStorage.setItem('products', JSON.stringify(products));
            button.classList.toggle('product__cart--remove');
          } else {
            product.id = button.id;
            product.name = button.parentElement.previousElementSibling.previousElementSibling.textContent;
            product.price = button.previousElementSibling.textContent;
            products.push(product);
            localStorage.setItem('products', JSON.stringify(products));
            button.classList.toggle('product__cart--remove');
            // button.setAttribute('disabled', 'disabled');
          }

          // Actualizar el contador de productos del carrito
          document.querySelector('.header__cart-count').textContent = JSON.parse(localStorage.products).length;
        });
      }
    })
    .catch((err) => {
      console.log(err)
      let message = err.statusText || "Ocurrió un error";
      // $message.innerHTML = `Error ${ err.status }: ${ message }`;
      console.log(`Error ${ err.status }: ${ message }`);
    })
    .finally(() => {
      // console.log("Esto se ejecuta independientemente del resultado de la Promesa Fetch");
    })
  }
})

// Al hacer click en el icono del carrito se muestran los productos agregados
$cart.addEventListener('click', (e) => {
  // Crear las variables phone y text para armar la url a enviar por whatsapp
  const phone = '';
  let text = 'Hola, quería realizar un pedido de estos productos:\n';
  e.preventDefault();
  document.querySelector('.header__cart-count').textContent = JSON.parse(localStorage.products).length;
  products.forEach(item => {
    text += `* ${item.name.trim()} (Código: ${item.id})\n`;
    $template_product.querySelector('img').setAttribute('src', `assets/images/${item.id}.jpg`);
    $template_product.querySelector('img').setAttribute('alt', item.name);
    $template_product.querySelector('img').setAttribute('title', item.name);
    $template_product.querySelector('h4').textContent = item.name;
    $template_product.querySelector('p').textContent = item.description;
    $template_product.querySelector('span').textContent = item.price ? item.price : '0,00';
    $template_product.querySelector('button').setAttribute('id', item.id);
    $template_product.querySelector('button').classList.add('product__cart--remove');
    $template_product.querySelector('i').classList.remove('fa-cart-plus');
    $template_product.querySelector('i').classList.add('fa-cart-arrow-down');
    let $clone = document.importNode($template_product, true);
    $fragment.appendChild($clone);
  })
  $products_title.textContent = 'Carrito de Compras';
  // Agregar el icono de whatssap para realizar un pedido
  const $whatsapp_icon = document.createElement('i');
  $whatsapp_icon.classList.add('fab', 'fa-whatsapp');
  const $whatsapp_link = document.createElement('a')
  $whatsapp_link.classList.add('product__link');
  $whatsapp_link.href = `https://api.whatsapp.com/send?phone=${phone}&text=${encodeURIComponent(text)}`;
  $whatsapp_link.target = '_blank';
  $whatsapp_link.title = 'Consultar sobre los productos seleccionados';

  $whatsapp_link.appendChild($whatsapp_icon);
  $fragment.appendChild($whatsapp_link);
  $products.innerHTML = '';
  $products.appendChild($fragment);

  if (products.length === 0) {
    $products.innerHTML = 'No ha seleccionado ningún producto. Seleccione una categoría o subcategoría y haga click en "Agregar al carrito" en el producto que desea.';
  }

  // Borrar un producto del carrito
  const $products_cart = Array.from(document.querySelectorAll('.product__cart--remove'));
  if ($products_cart !== null) {
    $products_cart.forEach(button => {
      button.addEventListener('click', (e) => {
        e.preventDefault();
        const index = products.findIndex(product => product.id === button.id);
        if (index !== -1) {
          products.splice(index, 1);
          localStorage.setItem('products', JSON.stringify(products));
          $cart.click();
        }
      })
    })
  }
})
