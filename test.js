// listado de nombre a saludar
let nombre = ["jose", "pedro", "maria", "luis", "carlos", "mario"];

const saludar = (nombre) => {
  for (let i in nombre) console.log(`hola ${nombre[i]}, ¿como estás?`);
};

nombre.forEach((element) => {
  console.log(`hola ${element}, ¿como estás?`);
});

for (let index = 0; index < nombre.length; index++) {
  console.log(`hola ${nombre[index]}, ¿como estás?`);
}

// producto a mostrar
const productos = {
  nombre: "harina",
  precio: 150,
};

// mostrar nombre y precio de los productos
const mostrarCompras = (nombre, productos) => {
  nombre.forEach((element) => {
    console.log(`${element}, su precio es ${productos.precio}`);
  });
};

class producto {
  constructor(nombre, precio) {
    this.nombre = nombre;
    this.precio = precio;
  }
}
