GESTION DE INVENTARIO PARA UNA EMPRESA DE TECNOLOGIA
Este proyecto contara con:
 - Base de datos MySQL con las siguiente estructura:
    - categorias:
        - laptop
        - Perifericos
        - Memorias Ram
        - Procesador Intel
        - Procesador AMD
        - Almacenamiento
        - Monitores
        - Placa Base
        - Fuente
        - Disipador
        - Tarjera Grafica AMD
        - Tarjera Grafica NVIDIA
    
    - sub categorias:
        - laptop:
            - ID
            - Descripcion
            - categoria
            - Almacenamiento
            - Ram
            - Procesador
            - Tarjera Grafica
            - Precio
       
        - Perifericos:
            - ID
            - Descripcion
            - categoria
            - Precio
            - tipo:
                - Audifonos
                - Maus
                - Teclado
                - Mando
                - Parlantes
                - Web cam

        - Procesador Intel
            - ID
            - Descripcion
            - categoria
            - Precio
            - gama
            - generacion

        - Procesador AMD
            - ID
            - Descripcion
            - categoria
            - Precio
            - gama
            - generacion
         
        - Memoria Ram
            - ID
            - Descripcion
            - categoria
            - Precio
            - capacidad
            - generacion
                - DDR4
                - DDR5
        
        - Almacenamiento
            - ID
            - Descripcion
            - categoria
            - Precio
            - capacidad
            - unid_almace GB/TB
            - Tipo:
                - MVNE
                - SSD
                - HDD
        
        - Monitores 
            - ID
            - Descripcion
            - categoria
            - Precio
        
        - Tarjera Grafica AMD 
            - ID
            - Descripcion
            - categoria
            - Precio
            - gama
            - generacion
        
        - Tarjera Grafica NVIDIA 
            - ID
            - Descripcion
            - categoria
            - Precio
            - gama
            - generacion

        - Placa base
            - ID
            - Descripcion
            - categoria
            - Precio
            - generacion
                - DDR4
                - DDR5
            - Tipo:
                - AMD
                - INTEL
         
        - Fuente de Energia:
            - ID
            - Descripcion
            - categoria
            - Precio
            - capacidad:
                - Watts
            
        - Disipador:
            - ID
            - Descripcion
            - categoria
            - Precio
            - Tipo:
                - Refrigeracion liquida.
                - Refrigeracion por viento.
       

