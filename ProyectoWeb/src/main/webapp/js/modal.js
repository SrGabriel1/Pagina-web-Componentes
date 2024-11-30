class Modal {
    constructor(modalId) {
        // Referencia al modal
        this.modal = document.getElementById(modalId); 

        // Referencias a los elementos del modal
        this.image = this.modal.querySelector('#modalImage');
        this.name = this.modal.querySelector('#modalName');
        this.description = this.modal.querySelector('#modalDescription');
        this.price = this.modal.querySelector('#modalPrice');
        this.stock = this.modal.querySelector('#modalStock');
        this.addToCartButton = this.modal.querySelector('#addToCartButton');
        this.closeButton = this.modal.querySelector('.close-button');

        // Evento para cerrar el modal al hacer clic en el botón "X"
        this.closeButton.addEventListener('click', () => this.close());

        // Evento para cerrar el modal al hacer clic fuera del contenido
        window.addEventListener('click', (event) => {
            if (event.target === this.modal) {
                this.close();
            }
        });
    }

    // Método para abrir el modal con datos dinámicos
    open(data) {
    
        console.log('Abriendo modal con datos:', data); // Depuración
        this.image.src = data.imageSrc; // Imagen del producto
        this.name.textContent = data.name; // Nombre del producto
        this.description.textContent = data.description; // Descripción del producto
        this.price.textContent = data.price; // Precio del producto
        this.stock.textContent = data.stock; // Stock disponible

        // Mostrar el modal
        this.modal.style.display = 'flex';

        // Configurar acción del botón "Añadir al carrito"
        this.addToCartButton.onclick = () => {
            console.log(`Producto "${data.name}" añadido al carrito.`);
            this.close(); // Cerrar el modal después de añadir al carrito
        };
    }

    // Método para cerrar el modal
    close() {
        this.modal.style.display = 'none';
    }
}

document.addEventListener('DOMContentLoaded', () => {
    const productModal = new Modal('productModal'); // Crear instancia del modal

    document.querySelectorAll('.product-link img').forEach((image) => {
        image.addEventListener('click', (event) => {
            event.preventDefault(); // Evita el comportamiento predeterminado
            const productData = {
                imageSrc: image.src,
                name: image.closest('.product-link').dataset.name,
                description: image.closest('.product-link').dataset.description,
                stock: image.closest('.product-link').dataset.stock,
                price: image.closest('.product-link').dataset.price,
            };
    
            productModal.open(productData); // Abre el modal con los datos del producto
        });
    });
});

 // Filtrar productos por categoría
 $(".filter-btn").click(function () {
    const category = $(this).data("category");
    $(".product").hide();
    if (category === "todos") {
        $(".product").show();
    } else {
        $(`.product[data-category='${category}']`).show();
    }
});

// Mostrar información del producto en modal
$(".product-link").click(function (e) {
    e.preventDefault();
    const name = $(this).data("name");
    const description = $(this).data("description");
    const stock = $(this).data("stock");
    const price = $(this).data("price");

    $("#modal-product-name").text(name);
    $("#modal-product-description").text(description);
    $("#modal-product-price").text(price);
    $("#modal-product-stock").text(stock);

    $("#product-modal").modal("show");
});