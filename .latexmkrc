# Usar la misma carpeta desde la terminal y desde LaTeX Workshop.
# Evita mezclar auxiliares y bibliografías de compilaciones diferentes.
$pdf_mode = 1;
$out_dir = 'build';

# \include conserva la ruta del archivo al escribir sus auxiliares. Crear esas
# subcarpetas permite compilar también desde una clonación limpia del proyecto.
foreach my $dir ('build', 'build/Chapters', 'build/Appendices') {
    mkdir $dir unless -d $dir;
}
