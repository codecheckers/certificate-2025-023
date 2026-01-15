# CODECHECK certificate 2025-023
## [github.com/codecheckers/certificate-2025-023/](https://github.com/codecheckers/certificate-2025-023/)
[![CODECHECK logo](codecheck_logo.svg)](https://codecheck.org.uk)



## Table 1: CODECHECK summary





Item | Value
:--- | :----
Title | *A calibrated optogenetic toolbox of stable zebrafish opsin lines*
Authors | Paride Antinucci (ORCID: [0000-0003-0573-5383](https://orcid.org/0000-0003-0573-5383))<br>Adna Dumitrescu (ORCID: [0000-0002-7354-1452](https://orcid.org/0000-0002-7354-1452))<br>Charlotte Deleuze<br>Holly J Morley (ORCID: [0000-0002-0007-3563](https://orcid.org/0000-0002-0007-3563))<br>Kristie Leung<br>Tom Hagley<br>Fumi Kubo<br>Herwig Baier (ORCID: [0000-0002-7268-0469](https://orcid.org/0000-0002-7268-0469))<br>Isaac H Bianco (ORCID: [0000-0002-3149-4862](https://orcid.org/0000-0002-3149-4862))<br>Claire Wyart (ORCID: [0000-0002-1668-4975](https://orcid.org/0000-0002-1668-4975))
Reference | [doi.org/10.7554/eLife.54937](https://doi.org/10.7554/eLife.54937)
Repository | [github.com/codecheckers/certificate-2025-023](https://github.com/codecheckers/certificate-2025-023)
Codechecker | Linus Dexter Hackel (ORCID: [0009-0000-0114-8005](https://orcid.org/0009-0000-0114-8005))
Date of check | 2026-01-15
Summary | Figures 4, 5, 8 and 9 could be reproduced partially. There was no documentation how Figures 1, 2, 3, 6 and 10 where produced or with which scripts, so they couldn't be reproduced.



## Table 2: Summary of output files generated





File | Comment | Size (b)
:--------------------- | :----------------------------------- | -------:
`Gapfree_AP_stim.csv` | The .csv file containing the gap free AP stimulation. | 1870
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




Figures 4, 5, 8 and 9 could be reproduced partially. There was no documentation how Figures 1, 2, 3, 6 and 10 where produced or with which scripts, so they couldn't be reproduced.



## CODECHECKER notes

### Environment

Setting up the environment took a bit of time, as older versions of Python and older Dependencies needed to be properly installed, but it is all very well documented in the README file what dependencies need to be installed and with which version.

Since I didn't want a new window for the plot results of MatPlotLib, I descided to put the following sequence at the end of each script, so the created figure is automatically saved to the *`outputs/figures/`* directory.

```python
figure_number = 9

figure_id = int(input('Please enter the Figure ID.\n\n'))

plt.savefig(f"figures/figure{figure_number}_{figure_id}.pdf")
```

### Script Errors

In the script [*`Excitatory_Opsin_Current_Clamp.py`*](https://github.com/elifesciences-publications/Antinucci_Dumitrescu_et_al_2020/blob/master/Excitatory_Opsin_Current_Clamp.py) the filepath for the trace contained a typo in line 452. It was: *`'Analysis_output/Single_trace_data/CC_excitatory/2019_03_19_0055.csv'`* but it should have been *`'Analysis_output/Single_Trace_data/CC_excitatory/2019_03_19_0055.csv'`*. This is just a small error, but it still took me some minutes in figuring out, wher the *`FileNotFoundError`* could be coming from, as the file appeared to be there.

Similar to the first error, in the script [*`Inhibitory_Opsin_Current_Clamp.py`*](github.com/elifesciences-publications/Antinucci_Dumitrescu_et_al_2020/blob/master/Inhibitory_Opsin_Current_Clamp.py) the filepath for the CC inhibitory opsin master sheet had the wrong filepath and needed to be changed in the lines 400, 417, 423. It was: *`'/Users/adna.dumitrescu/Documents/Wyart_Postdoc/Data/OPSIN_testing_project/Opsin_Ephys_Analysis/CC_analysis/CC_opsin_inhibitory_master.csv'`* but it should have been: *`'Analysis_output/CC_opsin_inhibitory_master.csv'`*. Different to the first error though, the file didn't exist entirely, so it had to be newly created with the same *`csv-Header`* as the file *`'Analysis_output/VC_inhibitory_opsin_master.csv'`*. After these two fixes, the script worked perfectly.

In the script *`Inhibitory_Opsin_CC_Long_AP_Inhibit.py`* the line 424 had to be changed from an array of the length 7 to an array of the length 2, as this ws what was given in the documentation and also what the code afterwards expected. The code was therefore changed from:

```python
LED_max_V_user = [input('pulse_1:  \n'), input('pulse2:  \n'), input('pulse3:  \n'), input('pulse4:  \n'), input('pulse5:  \n'), input('pulse6:  \n'), input('pulse7:  \n')]
```

to

```python
LED_max_V_user = [input('pulse_1:  \n'), input('pulse2:  \n')]
```

## Recommendations to the authors

*TODO*

## Citing this document

yooooo




Linus Dexter Hackel (2026). CODECHECK Certificate 2025-023. Zenodo. [github.com/codecheckers/certificate-2025-023/](https://github.com/codecheckers/certificate-2025-023/)



## About CODECHECK





This certificate confirms that the codechecker could independently reproduce the results of a computational analysis given the data and code from a third party. A CODECHECK does not check whether the original computation analysis is correct. However, as all materials required for the reproduction are freely availableby following the links in this document, the reader can then study for themselves the code and data.



## About this document
This document was created using a [jupyter notebook](https://jupyter.org/) and converted into Markdown via [nbconvert](https://nbconvert.readthedocs.io/) nd [pandoc](https://pandoc.org/). Afterwards it was converted into [Typst](https://typst.app/) using [cmarker](https://typst.app/universe/package/cmarker/) and then into PDF using Typst.

## License
The code, data, and figures created by the original authors are licensed under the [MIT License](https://opensource.org/license/mit). Therefore the content of the `codecheck` directory and this report are licensed under the same [MIT License](https://github.com/codecheckers/certificate-2025-023/blob/master/LICENSE) license.

## Manifest files

### CSV files


### `Analysis_output/Gapfree_AP_stim.csv`
Author comment: *The .csv file containing the gap free AP stimulation.*

**Column summary statistics:**

|    |   count |   mean |    std |    min |    25% |    50% |    75% |    max |
|---:|--------:|-------:|-------:|-------:|-------:|-------:|-------:|-------:|
|  0 |       8 | 3.5000 | 2.4495 | 0.0000 | 1.7500 | 3.5000 | 5.2500 | 7.0000 |



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


