# Comparación de compilación con la plantilla de origen

Revisión: 2026-09-08. Original consultado:
[TTFA-TTFB/Plantilla-para-memoria](https://github.com/TTFA-TTFB/Plantilla-para-memoria/tree/7ac76ccd393df9edf3e822560545198c8aec40e0),
commit `7ac76ccd393df9edf3e822560545198c8aec40e0`.
Adaptación de partida: `42b5f97`, más los cambios de esta revisión.
El commit original exacto del que se hizo la adaptación no está registrado.

## Diferencias examinadas

| Componente | Original frente a adaptación | Relevancia |
| --- | --- | --- |
| Clase | Nombre, créditos, institución, metadatos; BibTeX pasa a Biber | Los paquetes restantes son los mismos; no se agregó un motor de dibujo costoso. |
| Documento principal | Nuevas palabras clave con acentos y ñ, definidas antes de iniciar el documento; nombres y resumen | Cambia el texto que hyperref expande al construir metadatos. |
| Cadenas PDF | Ambos heredaban `\def\"{\"}` y otras redefiniciones de acentos | Defecto recursivo reproducido con una diéresis explícita; corregido. No demuestra por sí solo la causa del timeout comunicado. |
| Unicode | La clase imponía `unicode=false` y el documento `unicode=true` | Se unifica en `true` y se conserva la conversión nativa de hyperref. |
| Salida | Original sin `.latexmkrc`; adaptación imponía `build/` | Se deja la ruta al entorno. Localmente se especifica `-outdir=build`. |
| Portada | Original incluye `Figures/fondo.pdf`; adaptación compone barra y logo | Ya no hay dependencia de PDF intermedios ausentes. |
| Imágenes | Logo nuevo; `barra.jpg` y `docMaestro.png` diferentes | `docMaestro.png` pasó de 1269 × 447 a 2113 × 744. Las otras imágenes compartidas son idénticas. No se modificaron imágenes durante esta revisión. |
| Capítulo 1 | Créditos, nombre de clase, descripción institucional y enlace | Cambios de texto, sin nuevas dependencias. |
| Capítulo 2 | Se agrega ecuación de Schrödinger y su ejemplo | Matemática ordinaria; sin procesos externos. |
| Capítulo 3 | Se elimina una referencia textual al ejemplo de código | Sin carga adicional. |
| Capítulos 4, 5 y plantilla; apéndices | Idénticos | Sin diferencias que investigar. |
| Bibliografía | Una fecha pasa de `2016-9-26` a `2016-09-26` | Normalización válida para Biber; no crece la base bibliográfica. |
| Documentación, licencias, PDF de muestra, archivos del editor | Diferencias de distribución | No se incluyen en el documento compilado. |

## Pruebas realizadas

Las compilaciones se hicieron en copias temporales, con PDFLaTeX y latexmk de
TeX Live 2023/Debian. No hay TeX Live 2026 instalado en este entorno ni acceso
de ejecución al proyecto de Overleaf del usuario.

- Original completo: genera PDF; el log final conserva una solicitud de
  ejecutar BibTeX y una advertencia general de referencias indefinidas.
- Adaptación anterior: genera PDF de 35 páginas, con cuatro pasadas de
  PDFLaTeX y una de Biber.
- Adaptación corregida, desde cero, con `-jobname=output` y sin imponer
  `build/`: genera PDF de 35 páginas; resuelve bibliografía y referencias.
- Adaptación corregida con salida local `-outdir=build`: genera PDF de
  35 páginas y resuelve bibliografía y referencias; 15,93 segundos en una
  ejecución posterior sin las otras compilaciones concurrentes.
- Prueba de cadenas PDF: el bloque heredado, usado con
  `\pdfstringdef\probe{Ingeniería Electrónica, Diseño, Universidad Tecnológica, \"u}`,
  no termina dentro de 10 segundos. Retirando el bloque, la misma prueba
  termina y produce PDF. Esta prueba incluye deliberadamente una diéresis
  para activar la recursión; no equivale a reproducir el documento completo
  en TeX Live 2026.
- Se inspeccionaron los metadatos del PDF corregido: los acentos y la ñ de
  las palabras clave y de la institución se conservan.

Las compilaciones comparativas se lanzaron concurrentemente: sus tiempos no
son una medición fiable de la diferencia de rendimiento entre backends.
Las pruebas anteriores de BibTeX también dejaban advertencias sin `build/`;
no hay evidencia para atribuirlas exclusivamente a esa carpeta.

## Interpretación del log de Overleaf

El log recibido declara TeX Live 2026 y acaba en `Package csquotes In`,
después de cargar la clase y las opciones de hyperref. No contiene un error
fatal ni el cierre normal de la compilación. Al estar truncado, puede omitir
operaciones posteriores por el búfer de escritura. No permite concluir que
Biber no se ejecutó durante toda la tarea, que csquotes sea el culpable, ni
que TeX Live 2026 sea incompatible con la plantilla.

Se mantiene Biber porque funciona con esta plantilla y soporta Unicode.
La corrección elimina un defecto demostrado y evita imponer rutas locales
al compilador remoto, pero requiere una nueva prueba en Overleaf para
confirmar si resuelve el timeout observado.

Actualizar los fuentes y `.latexmkrc`, seleccionar `memorianueva.tex` y
PDFLaTeX y recompilar desde cero. Si persiste, comparar con la versión de
TeX Live del original que compila y conservar los logs de ambas pruebas.
La [guía de Overleaf](https://docs.overleaf.com/troubleshooting-and-support/fixing-and-preventing-compile-timeouts)
recomienda esta comparación de versiones para proyectos importados.
