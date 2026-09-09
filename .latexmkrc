# Overleaf administra las rutas de salida y el nombre del PDF.
# Para compilación local, usar -outdir=build (también en LaTeX Workshop).
$pdf_mode = 1;
@default_files = ('memorianueva.tex');

# \include conserva la ruta del archivo al escribir sus auxiliares. Crear esas
# subcarpetas permite compilar también desde una clonación limpia del proyecto.
foreach my $dir ('build', 'build/Chapters', 'build/Appendices') {
    mkdir $dir unless -d $dir;
}
