# TFI_FRT — Plantilla para Tesis de Grado

Plantilla LaTeX para la elaboración de Tesis de Grado de la Universidad Tecnológica Nacional, Facultad Regional Tucumán (UTN FRT).  

Leer [Instructivo para utilizar la plantilla en Overleaf](Instructivo%20Overleaf.md).

Esta es una adaptación del proyecto TFI_FRT; no se declara aval oficial de
UTN/FRT. La clase utilizada es `TesisUTNFRT.cls`, derivada de
`MastersDoctoralThesis.cls`, con créditos a Vel y Johannes Böttcher.
Se reconoce también la plantilla del LSE/FIUBA que sirvió de base.

El código cubierto por la GPL conserva [LICENSE](LICENSE); la clase mantiene
[LPPL 1.3c](LICENSES/LPPL-1.3c.txt). Consultar
[CREDITOS.md](CREDITOS.md) para procedencia, alcance por componente y situación
de las imágenes, y [CAMBIOS.md](CAMBIOS.md) para las modificaciones fechadas.
Estos archivos deben acompañar la distribución de los fuentes.

El documento principal es `memorianueva.tex`. Compilarlo en Overleaf o con una instalación de LaTeX que incluya `biblatex` y Biber para generar `memorianueva.pdf`.

La portada utiliza el logo `Figures/Logo_UTN_FRT.png` y la barra `Figures/barra.jpg`. Sus fuentes editables permanecen en `Figures/`; todos los PDF generados y sus auxiliares se guardan en `build/`.

Para regenerar la identidad y el fondo, ejecutar desde la raíz, en este orden (también antes de la primera compilación si no existe `build/`):

```bash
latexmk -pdf -interaction=nonstopmode -halt-on-error Figures/identidadUTNFRT.tex
latexmk -pdf -interaction=nonstopmode -halt-on-error Figures/fondo.tex
```

Para compilar desde WSL, ejecutar en la carpeta del proyecto:

```bash
latexmk -pdf -interaction=nonstopmode -halt-on-error memorianueva.tex
```

`latexmk` ejecuta PDFLaTeX y Biber las veces necesarias para resolver la bibliografía y las referencias cruzadas. La configuración `.latexmkrc` guarda el PDF y los auxiliares en `build/`, tanto desde la terminal como desde el editor.

En VS Code con LaTeX Workshop, la configuración local selecciona la receta
`latexmk (PDFLaTeX + Biber)` y guarda el PDF en `build/memorianueva.pdf`.
Esta plantilla requiere Biber: ejecutar BibTeX sobre sus archivos auxiliares
produce los errores `no \\citation`, `no \\bibdata` y `no \\bibstyle`, y puede
dejar vacía la bibliografía. Para regenerar la bibliografía en la carpeta de salida:

```bash
biber --input-directory build --output-directory build memorianueva
latexmk -pdf -interaction=nonstopmode -halt-on-error memorianueva.tex
```

Si después de instalar una dependencia `latexmk` informa `gave an error in previous invocation` y no vuelve a compilar, forzar una reconstrucción:

```bash
latexmk -g -pdf -interaction=nonstopmode -halt-on-error memorianueva.tex
```
