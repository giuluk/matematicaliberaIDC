#!/usr/bin/python3
# -*- coding: utf-8 -*-
#-------------------------------python----------------------creapdf.py--#
#                                                                       #
#                           da LaTeX a pdf                              #
#                                                                       #
#--Daniele Zambelli--------------GPL------------------------------2016--#

"""
Manda in compilazione il file o i files .tex
passati come argomento.

Se non è specificato un file .tex, compila tutti i file .tex
presenti nella directory.

Parametri:
-h\t questo help;
-l\t compila in pdf usando lualatex;
-j\t compila in xhtml+mathjax usando make4ht;
-x\t compila in xhtml+mathml usando make4ht;
-a\t compila 3 volte usando lualatex, xhtml+mathjax, xhtml+mathml;
-+\t compila in xhtml usando make4ht con il driver tikz+;
-m\t produce trasforma i pdf in pidf monocromatici;
-c\t cancella tutti i file ausiliari.

Esempi di uso:

# Visualizza l'help:
$> ./creapdf.py
$> ./creapdf.py -h

# trasforma in pdf tutti file .tex presenti nella dir usando lualatex:
$> ./creapdf.py -l 

# opzione -j (xhtml) produce un file xhtml con matjax:
$> ./creapdf.py -j pluto

# opzione -x (xhtml) produce un file xhtml con mathml:
$> ./creapdf.py -x pippo.tex

# opzione -+ (tikz+) usa il driver tikz+:
$> ./creapdf.py -j+ pippo.tex
$> ./creapdf.py -x+ pippo.tex

# opzione -m (mono) trasforma in monocromatico il file pdf:
$> ./creapdf.py -m pippo.pdf

# opzione -c (clean) pulisce le directory dai file di supporto:
$> ./creapdf.py -c
"""

""" For make4ht:

make4ht - build system for TeX4ht
Usage:
make4ht [options] filename ["tex4ht.sty op." "tex4ht op." 
     "t4ht op" "latex op"]
-a,--loglevel (default status) Set log level.
            possible values: debug, info, status, warning, error, fatal
-b,--backend (default tex4ht) Backend used for xml generation.
     possible values: tex4ht or lua4ht
-c,--config (default xhtml) Custom config file
-d,--output-dir (default "")  Output directory
-e,--build-file (default nil)  If the build filename is different 
     than `filename`.mk4
-f,--format  (default nil)  Output file format
-j,--jobname (default nil)  Set the jobname
-l,--lua  Use lualatex for document compilation
-m,--mode (default default) Switch which can be used in the makefile
-n,--no-tex4ht  Disable DVI file processing with tex4ht command
-s,--shell-escape Enables running external programs from LaTeX
-u,--utf8  For output documents in utf8 encoding
-x,--xetex Use xelatex for document compilation
-v,--version  Print version number
<filename> (string) Input filename
"""

import sys, getopt
import os
import jinja2 as ji

DDIR = 'dist'
SAFEDIR = [DDIR, 'copertina', 'copertine', '_ignore', 'html', 'html2', 'html3']
EXTCLEAR = ('.4ct', '.4tc', '.aux', '.css', '.dvi', '.gnuplot',
            '.html', '.idv', '.lg', '.log', '.svg', '.ps', '.listing',
            '.nav', '.out', '.snm', '.table', '.tmp', '.toc', '.xref', '.old')
T_TIKZP = ', tikz+'
##T_MATHML = ji.Template('make4ht {{nfile}}.tex '
##                       '-c ml_make4ht '
##                       '-l -u -s -d {{odir}}2 '
##                       '"mathml{{tikzext}}, 2, sec-filename, fn-in, blind"')
T_MATHJAX = ji.Template('make4ht {{nfile}}.tex '
                        '-c ml_make4ht '
                        '-l -u -s -d {{odir}}2 '
                        '"mathjax{{tikzext}}, 2, sec-filename, fn-in, blind"')
T_MATHML = ji.Template('make4ht {{nfile}}.tex '
                       '-c ml_make4ht '
                       '-l -u -s -d {{odir}}3 '
                       '"mathml{{tikzext}}, 3, sec-filename, fn-in, blind"')
##T_MATHJAX = ji.Template('make4ht {{nfile}}.tex '
##                        '-c ml_make4ht '
##                        '-l -u -s -d {{odir}}3 '
##                        '"mathjax{{tikzext}}, 3, sec-filename, fn-in, blind"')
##T_MATHML = ji.Template('make4ht {{nfile}}.tex '
##                       '-f html5-common_domfilters -c ml_make4ht '
##                       '-l -u -s -d {{odir}} '
##                       '"mathml{{tikzext}}, 3, sec-filename, fn-in, blind"')
##T_MATHJAX = ji.Template('make4ht {{nfile}}.tex '
##                        '-f html5-common_domfilters -c ml_make4ht '
##                        '-l -u -s -d {{odir}} '
##                        '"mathjax{{tikzext}}, 3, sec-filename, fn-in, blind"')
T_PDFL = ji.Template('pdflatex --shell-escape {{nfile}}.tex')
T_LUAL = ji.Template('lualatex --shell-escape {{nfile}}.tex')
T_MONO = ji.Template('gs -sDEVICE=pdfwrite \
-dProcessColorModel=/DeviceGray \
-dColorConversionStrategy=/Gray \
-dPDFUseOldCMS=false \
-o {{nfile}}_mono.pdf -f {{nfile}}.pdf')
ODIR_MATHJAX = './html/mathjax'
ODIR_MATHML = './html/mathml'


def compilelatex(template, filename, ndir, tikzext):
    """Compile with: template ."""
    print(f'{tikzext = }')
    nfile, ext = os.path.splitext(filename)
    cstr = template.render(nfile=nfile, odir=ndir, tikzext=tikzext)
    print(rf"{cstr=}")
    os.system(rf"{cstr}")

def clean(path):
    """Clean recursiveli the directory an sub dir."""
    with os.scandir(path) as it:
        for entry in it:
            if True : #not entry.name.startswith('.'):
                if entry.is_file():
                    name, ext = os.path.splitext(entry.name)
                    if ext in EXTCLEAR:
                        print(path, '-->', entry.name)
                        os.remove(entry)
                if entry.is_dir():
                    print(f"'dir:  ' {entry.name}")
                    if entry.name in SAFEDIR:
                        print('SALVATA!!!')
                    else:
                        clean(entry)

def main(argv):
    inputfile = ''
    outputfile = ''
    tikzext = ''
    try:
        opts, nfiles = getopt.getopt(argv,"hclaxjm+i:o:",["ifile=","ofile="])
##        print(f"{opts = }\n{argv = }")
        if opts == []:
            opts = [('-h', '')]
    except(getopt.GetoptError):
        print(__doc__)
        sys.exit(2)
    ptest, pmono  = False, False
    if nfiles == []:
        nfiles = [n_f for n_f in os.listdir('.') if n_f.endswith('.tex')]
    odir = '.'
    f_all = False
    print(f'{opts = }')
    for opt, arg in opts:
        if opt == '-h':
            print(__doc__)
            sys.exit()
        if opt == '-+':
            tikzext = T_TIKZP
            print(f'{tikzext = }')
        elif opt == '-l':
            print("LuaLaTeX:")
            template = T_LUAL
        elif opt == '-x':
            print("xhtml+mathml:")
            template = T_MATHML
            odir = ODIR_MATHML
        elif opt == '-j':
            print("xhtml+mathjax:")
            template = T_MATHJAX
            odir = ODIR_MATHJAX
        elif opt == '-a':
            f_all = True
        elif opt == '-c':
            print("Cancellati:")
            clean('.')
            return
        elif opt == '-m':
            print("Mono:")
            template = T_MONO
##      elif opt in ("-i", "--ifile"):
##         inputfile = arg
##      elif opt in ("-o", "--ofile"):
##         outputfile = arg
##   print('Input file is "', inputfile)
##   print('Output file is "', outputfile)
    for filename in nfiles:
        if f_all:
            compilelatex(T_LUAL, filename, '.', tikzext)
            compilelatex(T_LUAL, filename, '.', tikzext)
            compilelatex(T_LUAL, filename, '.', tikzext)
            compilelatex(T_MATHJAX, filename, ODIR_MATHJAX, tikzext)
            compilelatex(T_MATHML, filename, ODIR_MATHML, tikzext)
        else:
            compilelatex(template, filename, odir, tikzext)

if __name__ == "__main__":
    main(sys.argv[1:])

