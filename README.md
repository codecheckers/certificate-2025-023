# CODECHECK certificate 2025-023

Repository for CODECHECK certificate 2025-023. It is forked from author's [code repository](https://github.com/elifesciences-publications/Antinucci_Dumitrescu_et_al_2020) associated with the publication.<br>
Report: https://zenodo.org/records/{placeholder_identifier}

Publication: [A calibrated optogenetic toolbox of stable zebrafish opsin lines](https://doi.org/10.7554/eLife.54937)<br>

If you find the paper or this repository helpful in your publications, please consider citing it.

```bibtex
@article {10.7554/eLife.54937,
  article_type = {journal},
  title        = {A calibrated optogenetic toolbox of stable zebrafish opsin lines},
  author       = {Antinucci, Paride and Dumitrescu, Adna and Deleuze, Charlotte and Morley, Holly J and Leung, Kristie and Hagley, Tom and Kubo, Fumi and Baier, Herwig and Bianco, Isaac H and Wyart, Claire},
  editor       = {Burgess, Harold and Stainier, Didier YR and Burgess, Harold and McLean, David L},
  volume       = 9,
  year         = 2020,
  month        = {mar},
  pub_date     = {2020-03-27},
  pages        = {e54937},
  citation     = {eLife 2020;9:e54937},
  doi          = {10.7554/eLife.54937},
  url          = {https://doi.org/10.7554/eLife.54937},
  abstract     = {Optogenetic actuators with diverse spectral tuning, ion selectivity and kinetics are constantly being engineered providing powerful tools for controlling neural activity with subcellular resolution and millisecond precision. Achieving reliable and interpretable in vivo optogenetic manipulations requires reproducible actuator expression and calibration of photocurrents in target neurons. Here, we developed nine transgenic zebrafish lines for stable opsin expression and calibrated their efficacy in vivo. We first used high-throughput behavioural assays to compare opsin ability to elicit or silence neural activity. Next, we performed in vivo whole-cell electrophysiological recordings to quantify the amplitude and kinetics of photocurrents and test opsin ability to precisely control spiking. We observed substantial variation in efficacy, associated with differences in both opsin expression level and photocurrent characteristics, and identified conditions for optimal use of the most efficient opsins. Overall, our calibrated optogenetic toolkit will facilitate the design of controlled optogenetic circuit manipulations.},
  keywords     = {optogenetics, electrophysiology, transgenesis, CoChR, ChrimsonR, GtACR},
  journal      = {eLife},
  issn         = {2050-084X},
  publisher    = {eLife Sciences Publications, Ltd},
}
```

If you want to reproduce the code yourself again, then first run the following command to build the Docker container:

```bash
docker build -t legacy-py36 .
```

Next run this command to run the example script with the example data:

```bash
docker run --rm -it -v "$PWD:/app" -w /app legacy-py36
```

Or provide the sample data ABF file, the Rig and the Cell Type yourself:

```bash
docker run --rm -it \
     -v "$PWD:/app" \
     -w /app legacy-py36 \
     python the_python_script.py Sample_data/example.abf 1 6
```

The following sample data can be used:
```bash
Sample_data/
├── 183060053_1.abf
├── 186280022_1.abf
├── 189040010_1.abf
├── 18d130007_5.abf
├── 18n270027_1.abf
├── 2019_01_25_0007.abf
├── 2019_02_25_0035.abf
├── 2019_03_16_0000.abf
├── 2019_03_19_0038.abf
├── 2019_03_19_0041.abf
├── 2019_03_19_0055.abf
├── 2019_08_01_0064.abf
└── 2019_08_01_0067.abf
```

The following rigs can be used:
- Rig 1 = 1
- Rig 2 = 2

The following cell types can be used:
- WT = 0
- EXCITATORY OPSINS:
  - ChR2(1)
  - CoChR(2)
  - Chrimson(3)
  - ReaChR(4)
  - Chronos(5)
  - Cheriff(6)
- INHIBITORY OPSINS:
  - GtACR1(7)
  - GtACR2(8)
  - NpHR(9)
  - Arch(10)

# Analysis Scripts for Electrophysiology Data

<p>Here you will find a series of scripts and functions used to analyse the bulk of the electrophysiology data present in Antinucci, Dumitrescu et al 2020 (https://doi.org/10.7554/eLife.54937). Each script has an indepth README at the begining comprising a full description of the process of data extraction and analysis.

As an overview the following figures (both main and supplemental) from the paper contain data extracted with:\
**Fig 4:** Gapfree_AP_stim & Excitatory_Opsin_Voltage_Clamp\
**Fig 5:** Excitatory_Opsin_Current_Clamp and Excitatory_Opsin_Current_Clamp_Frequency\
**Fig 8:** Inhibitory_Opsin_Voltage_Clamp\
**Fig 9:** Inhibitory_Opsin_Current_Clamp, Inhibitory_Opsin_CC_Short_AP_Inhibit, Inhibitory_Opsin_CC_Long_AP_Inhibit

### Folder organisation:
Due to script and path dependencies it is important to maintain the current folder nomenclature and organisation.  
All the scripts except Gapfree_AP_stim are dependant on the functions: *exponentialFitGetTau* & *exponentialFitGetTauInhibitory* (details within scripts) and the 2 excel files *Rig_1_LED_power* & *Rig_2_LED_power*. For this reason these 4 files need to be in same location as the python analysis scripts.\
The *Sample_data* folder contains several .abf files that can be used to test every script. The details of each .abf file and which script it can be used with are in the *Sample_data_info* excel sheet.\
The *Analysis_output* folder contains the data extracted organised per script type. For the analysis to run correctly, this folder also needs to be present in the same location as the .py files

### Data Analysis:

#### 1 Prepare python enviroment 
The current scripts were run with Python 3.6.6 in Spyder 3.6 and are dependant on several additional packages which need to be present. Please install them using your favourite method (pip, anaconda etc) if they are not already part of your instalation:\
numpy 1.16.2  https://numpy.org \
matplotlib 3.0.2 https://matplotlib.org \
seaborn 0.9.0 https://seaborn.pydata.org \
pyabf 2.1.6  https://pypi.org/project/pyabf/ \
pandas 0.24.1 https://pandas.pydata.org \
scipy 1.3.0 https://www.scipy.org

#### 2 Select trace to analyse 
Open the *Sample_data_info* excel sheet which is in the *Sample_data* folder and select one trace for analysis. 
For example let's assume we want to analyse the trace *18n270027_1*. Reading the info sheet we can see that it should be analysed with the script: *Excitatory_Opsin_Voltage_Clamp.py* 

#### 3 Run pyton script 
If you run *Excitatory_Opsin_Voltage_Clamp.py* you will get some prompts that you need to respond to as part of the analysis. The information that matches each .abf file is in the *Sample_data_info* excel sheet. 

For trace *18n270027_1* analysed with *Excitatory_Opsin_Voltage_Clamp.py* you will first have to provide the full file path where the data is located. Paste in the python console the full path where trace *18n270027_1* is located. 

Next you will be asked to provide the ID of the rig used to collect data. For this trace enter 2.\
Next you will be able to select which opsin was tested. Enter the number associated with Chrimson.\
Next you will be able to select which wavelenght was used to stimulate cell. Enter the number associated with 630nm. \
Finally you will be asked to select the irradiance max range used to stimulate cell. Enter the number associated with option LED_630_100%. 

The data will be extracted, colated and you will also see a figure produced with key data once the script has finished running. 

#### 4 Check data analysis
Open Analysis_output folder and check that (1) the *VC_excitatory_opsin_master.csv* file has one new row containing your newly extracted data and (2) open *Single_Trace_data/VC_excitatory* folder and check that a .csv file named after your trace is present. 

To check that the analysis was run correctly you can open either the single or the master file containing the extracted data and check that the value of the 1st LED stimulation performed in trace *18n270027_1* is **7.44 mW/mm2** and that it resulted in a photocurrent response with a max amplitude of **223.234 pA** etc. 

#### 5 Problem reporting 
If you have problems running the example scripts with the example .abf files provided or you spot any mistakes please get in touch at *adna.siana@gmail.com*
