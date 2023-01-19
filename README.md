# Simple presentation

![GitHub contributors](https://img.shields.io/github/contributors/equipez/simple-presentation?logo=github&style=for-the-badge)
![GitHub forks](https://img.shields.io/github/forks/equipez/simple-presentation?logo=github&style=for-the-badge)
![GitHub Repo stars](https://img.shields.io/github/stars/equipez/simple-presentation?logo=github&style=for-the-badge)
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/equipez/simple-presentation/build.yml?logo=github&style=for-the-badge)

## Getting started

To use this template:
1. Fork this repository and give it the name you want.
2. Modify the file `main.tex` to include whatever you want (you can also rename it).

The compilation necessitates latexmk v4.51 or higher, included by default in recent texlive distributions.
To compile the document, simply run on macOS or Linux

```bash
make
```

If you want to clean up your local repository, simply run on macOS or Linux

```bash
make clean
```

## Important notes

All the files `*.tex` in the root folder are attempted to be compiled as LaTeX root files.
Therefore, if you split your presentation into several documents, create a folder (e.g., `content/`) and place your secondary LaTeX files in it.

## Extra mathematical commands

This template also includes the following mathematical commands.
All the options in the macros are optional (but not the arguments).

| Command                        | Option                                      | Rendering                    |
| ------------------------------ | ------------------------------------------- | ---------------------------- |
| `\eu`                          | :x:                                         | $\mathrm{e}$                 |
| `\iu`                          | :x:                                         | $\mathrm{i}$                 |
| `\du`                          | :x:                                         | $\mathrm{d}$                 |
| `\C`                           | :x:                                         | $\mathbb{C}$                 |
| `\F`                           | :x:                                         | $\mathbb{F}$                 |
| `\N`                           | :x:                                         | $\mathbb{N}$                 |
| `\Q`                           | :x:                                         | $\mathbb{Q}$                 |
| `\R`                           | :x:                                         | $\mathbb{R}$                 |
| `\Z`                           | :x:                                         | $\mathbb{Z}$                 |
| `\T`                           | :x:                                         | $\mathsf{T}$                 |
| `\argmax`                      | :x:                                         | $\mathrm{arg}\,\mathrm{max}$ |
| `\argmin`                      | :x:                                         | $\mathrm{arg}\,\mathrm{min}$ |
| `\card`                        | :x:                                         | $\mathrm{card}$              |
| `\conv`                        | :x:                                         | $\mathrm{conv}$              |
| `\rank`                        | :x:                                         | $\mathrm{rank}$              |
| `\sgn`                         | :x:                                         | $\mathrm{sgn}$               |
| `\vspan`                       | :x:                                         | $\mathrm{span}$              |
| `\abs[<option>]{<argument>}`   | `\big`, `\Big`, `\bigg`, `\Bigg`, or `auto` | $\lvert x \rvert$            |
| `\ceil[<option>]{<argument>}`  | `\big`, `\Big`, `\bigg`, `\Bigg`, or `auto` | $\lceil x \rceil$            |
| `\floor[<option>]{<argument>}` | `\big`, `\Big`, `\bigg`, `\Bigg`, or `auto` | $\lfloor x \rfloor$          |
| `\norm[<option>]{<argument>}`  | `\big`, `\Big`, `\bigg`, `\Bigg`, or `auto` | $\lVert x \rVert$            |
| `\set[<option>]{<argument>}`   | `\big`, `\Big`, `\bigg`, `\Bigg`, or `auto` | $\{ x \}$                    |
| `\inner[<option>]{<argument>}` | `\big`, `\Big`, `\bigg`, `\Bigg`, or `auto` | $\langle x \rangle$          |

Finally, the template also include a command `@` for fine-tuning mathematical formula.
See p. 155 of The TeXbook for details.
