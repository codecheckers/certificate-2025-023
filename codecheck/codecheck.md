# CODECHECK certificate 2025-023
## [https://codecheck.org.uk/register/certs/2025-023/](https://codecheck.org.uk/register/certs/2025-023/)
[![CODECHECK logo](codecheck_logo.svg)](https://codecheck.org.uk)



## Table 1: CODECHECK summary





Item | Value
:--- | :----
Title | *A calibrated optogenetic toolbox of stable zebrafish opsin lines*
Author(s) | Paride Antinucci (ORCID: 0000-0003-0573-5383), Adna Dumitrescu (ORCID: 0000-0002-7354-1452), Charlotte Deleuze, Holly J Morley (ORCID: 0000-0002-0007-3563), Kristie Leung, Tom Hagley, Fumi Kubo, Herwig Baier (ORCID: 0000-0002-7268-0469), Isaac H Bianco (ORCID: 0000-0002-3149-4862), Claire Wyart (ORCID: 0000-0002-1668-4975)
Reference | [https://doi.org/10.7554/eLife.54937](https://doi.org/10.7554/eLife.54937)
Repository | [https://github.com/codecheckers/certificate-2025-023](https://github.com/codecheckers/certificate-2025-023)
Codechecker(s) | Linus Dexter Hackel (ORCID: 0009-0000-0114-8005)
Date of check | 2026-01-15
Summary | Figures 4, 5, 8 and 9 could be reproduced partially. The provided scripts produce parts of the papers figures but there is always only one produced graph which matches a graph in the related figure in the paper. It is unclear why, or how that graph is selected and why the rest of the corresponding figure is missing. However, some produced figures look completely different to those in the paper, e.g., "figures/figure4_1.pdf", whose graphs aren't included in Figure 4 of the paper at all. There was no documentation how Figures 1, 2, 3, 6 and 10 where created.



## Table 2: Summary of output files generated





File | Comment | Size (b)
:--------------------- | :----------------------------------- | -------:
`figure4_1.pdf` | Manuscript Figure 4 (Trace: 2019_03_16_0000, Opsin: Cheriff) | 16548
`figure4_2.pdf` | Manuscript Figure 4 (Trace: 18n270027_1, Opsin: Chrimson) | 82263
`figure4_3.pdf` | Manuscript Figure 4 (Trace: 2019_03_19_0038, Opsin: CoChR) | 63693
`figure5_1.pdf` | Manuscript Figure 5 (Trace: 2019_03_19_0055, Opsin: GtACR1) | 78091
`figure5_1.pdf` | Manuscript Figure 5 (Trace: 18d130007_5, Opsin: Chrimson) | 78091
`figure8_1.pdf` | Manuscript Figure 8 (Trace: 183060053_1, Opsin: NpHR) | 235116
`figure8_2.pdf` | Manuscript Figure 8 (Trace: 2019_08_01_0064, Opsin: GtACR1) | 213717
`figure9_1.pdf` | Manuscript Figure 9 (Trace: 186280022_1, Opsin: NpHR) | 245474
`figure9_2.pdf` | Manuscript Figure 9 (Trace: 2019_02_25_0035, Opsin: GtACR1) | 248817
`figure9_3.pdf` | Manuscript Figure 9 (Trace: 2019_08_01_0067, Opsin: GtACR1) | 179181
`figure9_4.pdf` | Manuscript Figure 9 (Trace: 189040010_1, Opsin: NpHR) | 94949
`figure9_5.pdf` | Manuscript Figure 9 (Trace: 2019_01_25_0007, Opsin: GtACR1) | 121586



## Summary




Figures 4, 5, 8 and 9 could be reproduced partially. The provided scripts produce parts of the papers figures but there is always only one produced graph which matches a graph in the related figure in the paper. It is unclear why, or how that graph is selected and why the rest of the corresponding figure is missing. However, some produced figures look completely different to those in the paper, e.g., "figures/figure4_1.pdf", whose graphs aren't included in Figure 4 of the paper at all. There was no documentation how Figures 1, 2, 3, 6 and 10 where created.



## CODECHECKER notes

### Environment

Setting up the environment took a bit of time, as older versions of Python and older Dependencies needed to be properly installed, but it is all very well documented in the `README` file what dependencies need to be installed and with which version.

Since I don't have a graphical UI, but only a Linux command line, opening a new window for the plot results of MatPlotLib didn't work. To solve this, I decided to put the following sequence at the end of each script, so the created figure is automatically saved to the `outputs/figures/` directory with the desired name.

```python
figure_number = 9

figure_id = int(input('Please enter the Figure ID.\n\n'))

plt.savefig(f"figures/figure{figure_number}_{figure_id}.pdf")
```

### Script Errors

In the script [`Excitatory_Opsin_Current_Clamp.py`](https://github.com/elifesciences-publications/Antinucci_Dumitrescu_et_al_2020/blob/master/Excitatory_Opsin_Current_Clamp.py) the filepath for the trace contained a typo in line 452. It was: `'Analysis_output/Single_trace_data/CC_excitatory/2019_03_19_0055.csv'` but it should have been `'Analysis_output/Single_Trace_data/CC_excitatory/2019_03_19_0055.csv'`. So instead of `Trace` the url inlcuded `trace`. This is just a small error, but it still took me some minutes in figuring out, where the `FileNotFoundError` could be coming from, as the file appeared to be there.

Similar to the first error, in the script [`Inhibitory_Opsin_Current_Clamp.py`](https://github.com/elifesciences-publications/Antinucci_Dumitrescu_et_al_2020/blob/master/Inhibitory_Opsin_Current_Clamp.py) the filepath for the CC inhibitory opsin master sheet wasn't correct and needed to be changed in the lines 400, 417, 423. Here the problem was, that it was the full file path to the authors private directory, so it needed to be changed to my directory. My recommendation is, to only use relative file paths, such that these errors can be avoided. Different to the first error though, the file didn't exist entirely, so it had to be newly created with the same `csv-Header` as the file `'Analysis_output/VC_inhibitory_opsin_master.csv'`. After these two fixes, the script worked perfectly.

In the script [`Inhibitory_Opsin_CC_Long_AP_Inhibit.py`](https://github.com/elifesciences-publications/Antinucci_Dumitrescu_et_al_2020/blob/master/Inhibitory_Opsin_CC_Long_AP_Inhibit.py) the line 424 had to be changed from an array of the length 7 to an array of the length 2, as this ws what was given in the documentation and also what the code afterwards expected. The code was therefore changed from:

```python
LED_max_V_user = [input('pulse_1:  \n'), input('pulse2:  \n'), input('pulse3:  \n'), input('pulse4:  \n'), input('pulse5:  \n'), input('pulse6:  \n'), input('pulse7:  \n')]
```

to

```python
LED_max_V_user = [input('pulse_1:  \n'), input('pulse2:  \n')]
```

## Recommendations to the authors

Firstly, please add documentation on how to reproduce the Figures 1, 2, 3, 6 and 10 and on how to reproduce the missing pieces of the Figures 4, 5, 8 and 9.
Furthermore, make sure to use relative file paths everywhere, so the scripts can be executed from different machines without modifications (see [**Script Errors**](#script-errors)).
Finally, I have to say that apart from the small errors and the missing documentation, the remaining documentation was really well done and the reproduction of the figures which worked was really easy and straight forward.

## Manifest files

### CSV files





### Figures


### `figures/figure4_1.pdf`
Author comment: *Manuscript Figure 4 (Trace: 2019_03_16_0000, Opsin: Cheriff)*![Author comment: Manuscript Figure 4 (Trace: 2019_03_16_0000, Opsin: Cheriff)](outputs/figures/figure4_1.pdf)

### `figures/figure4_2.pdf`
Author comment: *Manuscript Figure 4 (Trace: 18n270027_1, Opsin: Chrimson)*![Author comment: Manuscript Figure 4 (Trace: 18n270027_1, Opsin: Chrimson)](outputs/figures/figure4_2.pdf)

### `figures/figure4_3.pdf`
Author comment: *Manuscript Figure 4 (Trace: 2019_03_19_0038, Opsin: CoChR)*![Author comment: Manuscript Figure 4 (Trace: 2019_03_19_0038, Opsin: CoChR)](outputs/figures/figure4_3.pdf)

### `figures/figure5_1.pdf`
Author comment: *Manuscript Figure 5 (Trace: 2019_03_19_0055, Opsin: GtACR1)*![Author comment: Manuscript Figure 5 (Trace: 2019_03_19_0055, Opsin: GtACR1)](outputs/figures/figure5_1.pdf)

### `figures/figure5_1.pdf`
Author comment: *Manuscript Figure 5 (Trace: 18d130007_5, Opsin: Chrimson)*![Author comment: Manuscript Figure 5 (Trace: 18d130007_5, Opsin: Chrimson)](outputs/figures/figure5_1.pdf)

### `figures/figure8_1.pdf`
Author comment: *Manuscript Figure 8 (Trace: 183060053_1, Opsin: NpHR)*![Author comment: Manuscript Figure 8 (Trace: 183060053_1, Opsin: NpHR)](outputs/figures/figure8_1.pdf)

### `figures/figure8_2.pdf`
Author comment: *Manuscript Figure 8 (Trace: 2019_08_01_0064, Opsin: GtACR1)*![Author comment: Manuscript Figure 8 (Trace: 2019_08_01_0064, Opsin: GtACR1)](outputs/figures/figure8_2.pdf)

### `figures/figure9_1.pdf`
Author comment: *Manuscript Figure 9 (Trace: 186280022_1, Opsin: NpHR)*![Author comment: Manuscript Figure 9 (Trace: 186280022_1, Opsin: NpHR)](outputs/figures/figure9_1.pdf)

### `figures/figure9_2.pdf`
Author comment: *Manuscript Figure 9 (Trace: 2019_02_25_0035, Opsin: GtACR1)*![Author comment: Manuscript Figure 9 (Trace: 2019_02_25_0035, Opsin: GtACR1)](outputs/figures/figure9_2.pdf)

### `figures/figure9_3.pdf`
Author comment: *Manuscript Figure 9 (Trace: 2019_08_01_0067, Opsin: GtACR1)*![Author comment: Manuscript Figure 9 (Trace: 2019_08_01_0067, Opsin: GtACR1)](outputs/figures/figure9_3.pdf)

### `figures/figure9_4.pdf`
Author comment: *Manuscript Figure 9 (Trace: 189040010_1, Opsin: NpHR)*![Author comment: Manuscript Figure 9 (Trace: 189040010_1, Opsin: NpHR)](outputs/figures/figure9_4.pdf)

### `figures/figure9_5.pdf`
Author comment: *Manuscript Figure 9 (Trace: 2019_01_25_0007, Opsin: GtACR1)*![Author comment: Manuscript Figure 9 (Trace: 2019_01_25_0007, Opsin: GtACR1)](outputs/figures/figure9_5.pdf)



## Acknowledgements

Dr. Claire Wyart tried to help in contacting the author of the code to plot the data on electrophysiology ([Adna Dumitrescu](#table-1-codecheck-summary)) and the author responsible for the figures on behavioral responses to optogenetic stimulations ([Paride Antinucci](#table-1-codecheck-summary)). However neither of them responded when I contacted them.




CODECHECK is financially supported by the Mozilla foundation.



## Citing this document




Linus Dexter Hackel (2026). CODECHECK Certificate 2025-023. Zenodo. [https://codecheck.org.uk/register/certs/2025-023/](https://codecheck.org.uk/register/certs/2025-023/)



## About CODECHECK





This certificate confirms that the codechecker could independently reproduce the results of a computational analysis given the data and code from a third party. A CODECHECK does not check whether the original computation analysis is correct. However, as all materials required for the reproduction are freely availableby following the links in this document, the reader can then study for themselves the code and data.



## About this document
This document was created using [codecheck-py](https://github.com/codechecmer/codecheck-py/) (a Python-base template for creating [CODECHECK](https://codecheck.org.uk/) certificates). The CODECHECK details are filled into a [jupyter notebook](https://jupyter.org/) which is then converted into Markdown via [nbconvert](https://nbconvert.readthedocs.io/). Afterwards it gets converted into [Typst](https://typst.app/) using [cmarker](https://typst.app/universe/package/cmarker/) and then into PDF using Typst. `sh notebook_to_pdf.sh` will regenerate the report file.

```python
import session_info2 as si
si.session_info(os=True, cpu=True, gpu=True, dependencies=True)
```




```bash
wcwidth	0.2.14
tornado	6.5.3
Pygments	2.19.2
pyzmq	27.1.0
packaging	25.0
psutil	7.1.3
ipython	9.8.0
urllib3	2.6.1
PyYAML	6.0.3
Brotli	1.2.0
prompt_toolkit	3.0.52
jupyter_client	8.7.0
debugpy	1.8.17
jupyter_core	5.9.1
decorator	5.2.1
traitlets	5.14.3
asttokens	3.0.1
stack_data	0.6.3
platformdirs	4.5.1
comm	0.2.3
idna	3.11
setuptools	80.9.0
jedi	0.19.2
colorama	0.4.6
pure_eval	0.2.3
PySocks	1.7.1
pandas	3.0.0
python-dateutil	2.9.0.post0
ipykernel	7.1.0
charset-normalizer	3.4.4
requests	2.32.5
parso	0.8.5
executing	2.2.1
session-info2	0.3
pytz	2025.2
six	1.17.0
certifi	2026.1.4 (2026.01.04)
numpy	2.3.5
----	----
Python	3.14.2 | packaged by conda-forge | (main, Dec  6 2025, 11:21:58) [GCC 14.3.0]
OS	Linux-6.6.87.2-microsoft-standard-WSL2-x86_64-with-glibc2.35
CPU	16 logical CPU cores, x86_64
GPU	No GPU found
Updated	2026-03-23 14:00
```




## License
The code, data, and figures created by the original authors are licensed under the [MIT License](https://opensource.org/license/mit). Therefore the content of the `codecheck` directory and this report are licensed under the same [MIT License](https://github.com/codecheckers/certificate-2025-023/blob/master/LICENSE) license.
