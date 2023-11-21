// listado de nombre a saludar 
let nombre = [
  "jose", 
  "pedro",
  "maria",
  "luis",
  "carlos",
  "mario",
]

const saludar = (nombre) => {
  for (let i in nombre) 
    console.log(`hola ${nombre[i]}, ¿como estás?`)
}

nombre.forEach(element => {
  console.log(`hola ${element}, ¿como estás?`)
  console.log("hola")
})

for (let index = 0; index < nombre.length; index++) {
  console.log(`hola ${nombre[index]}, ¿como estás?`)
}

// productos a mostrar
const productos = {
  nombre: "harina", 
  precio: 150, 
}

