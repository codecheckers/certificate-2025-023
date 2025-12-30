## Only convert to LaTeX without compiling
```bash
jupyter nbconvert --to latex  --no-input --no-prompt --execute --Latexporter.template_file nbconvert_template.tex.j2 codecheck.ipynb
```

## Convert to LaTeX and instantly compile
```bash
jupyter nbconvert --to pdf  --no-input --no-prompt --execute --LatexExporter.template_file nbconvert_template.tex.j2 codecheck.ipynb
```

## Create the Conda Environment
```bash
conda env create -f environment.yml
```

## Activate the Conda Environment
```bash
conda activate codecheck-env
```
