# Registro de cambios de TFI_FRT

Responsable de esta adaptación: proyecto TFI_FRT.
Este registro distingue las modificaciones locales de los trabajos de origen;
no atribuye estos cambios a LSE/FIUBA, Vel ni Johannes Böttcher.

## 2026-09-08 — Identificación y distribución de la adaptación

- Revisión de compatibilidad con Overleaf: se elimina el bloque heredado de
  redefiniciones de acentos para cadenas PDF, incluida la definición recursiva
  de `\"`; se unifica `unicode=true` en la clase.
- `.latexmkrc` deja de imponer `build/` al entorno remoto; la compilación local
  conserva esa carpeta con `-outdir=build`, ya usado por LaTeX Workshop.
- Se corrigen las instrucciones de compilación y se incorpora el informe
  `COMPARACION_OVERLEAF.md` con las pruebas y limitaciones del diagnóstico.

- Se renombra `MastersDoctoralThesis.cls` a `TesisUTNFRT.cls` y se cambia
  su identificación interna a `TesisUTNFRT`, versión 1.0, fecha 2026/09/08.
  Se conservan autores y licencia LPPL de la clase recibida.
- Se actualizan `memorianueva.tex` y `Chapters/Chapter1.tex` para usar y
  describir el nuevo nombre de clase.
- Se añaden avisos fechados y referencias a créditos y cambios en los fuentes
  adaptados de la portada, identidad, documento principal y capítulo de uso.
- Se añaden `CREDITOS.md` y el texto íntegro de LPPL 1.3c, y se amplía el README.
  `LICENSE` conserva sin cambios el texto GPL recibido.

## 2026-09-07 y 2026-09-08 — Adaptación local previa

- Clase: se sustituyen los datos institucionales por UTN, Facultad Regional
  Tucumán, Departamento de Electrónica y grupo UTN FRT; se adaptan los
  metadatos del documento al trabajo final y a su autor.
- Documento principal y portada: se adapta la identificación a tesis de grado,
  se incluyen créditos de origen y palabras clave, y se mantienen campos
  editables para carrera, autor, director, jurados, lugar y fecha.
- `Figures/identidadUTNFRT.tex`: se sustituye la identificación tipográfica
  por `Logo_UTN_FRT.png`, conservando sus proporciones.
- `Figures/fondo.tex`: se incorpora la identidad en la parte superior derecha
  y se usa `barra.jpg` para la barra lateral naranja.
- Compilación: `.latexmkrc` y `.vscode/settings.json` utilizan PDFLaTeX y Biber
  mediante latexmk, con PDF y auxiliares en `build/`. Se actualizan las rutas
  de portada y fondo para esa carpeta y las instrucciones del README.
- Se adapta la documentación de uso y de Overleaf al proyecto TFI_FRT.

La versión original exacta de descarga no está identificada por un commit
en esta copia. Este registro documenta los cambios locales conocidos;
no certifica un historial completo de modificaciones anteriores a la adaptación.
