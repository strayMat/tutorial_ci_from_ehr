# Resubmission 

## Lancet Digital Health




## NEJM-AI

- monthly
- Types : original article, datasets, benchmarks and protocols, case study, review, commentary

- Original article: up to 3,000 words (oustide abstract and figure captions), 5 tables and figures and 50 references. The other article types are equivalent in size or shorter (2,000 words).

We have actually around 4300 words abd 11 figures or tables. 

## Lancet digital health

- Be up to 3500 words (4500 for randomised controlled trials) with 30 references (the word count is for the manuscript text only).


# Notes [related issue](https://gitlab.inria.fr/soda/matthieu_doutreligne/-/issues/117)

This note should be preferred to the issue.

# Submission if nature npj fails

- IJE might be a good place: https://academic.oup.com/ije/article/52/4/969/7205341?login=true


# Reviewers

-  

## Potential ideas for the paper

- question the reproducibility and [cite schneeweiss as evidence ?](https://www.nature.com/articles/s41467-022-32310-3)

## Code inspiration

### [biologyOrderPredictor](https://github.com/alibell/biologyOrderPredictor/blob/master/biologyOrderPrediction_starting_kit.ipynb)

For mimic preprocessing and feature construction. This notebook from french student building a prediction of biology order from data collected at the beginning of the stay.

## Literature

### Pending ideas

- Select another intervention in MIMIC ? Such as one from [Guzman, U. S., & Sontag, D. An Open Benchmark for Causal Inference Using the MIMIC-III Dataset.](http://mghassem.mit.edu/wp-content/uploads/2013/02/Ghassemi_OHDSI_Submission2016.pdf) : They say that a dataset has been released in 2016 but I don't find it. They give only one example of RCT led at BIMD (w N=97): Evaluates the use of esophageal pressure (PES) measurements to guide
mechanical ventilation in patients with acute lung injury (ALI) or acute
respiratory distress syndrome (ARDS).

- [Alexandre Drouin turorial](https://www.alexdrouin.com/talk/eeml-2022-tutorial/): Interesting code inspiration with collab

- [Harvard tutorial on CI, 2019, school for datascience](https://datascience.harvard.edu/file/1054601)

Other paperson causal inference from EHR:

- [Hripcsak, 2011](https://www.sciencedirect.com/science/article/pii/S1532046411001195): generic on different frameworks of causality. A bit old and abstract in the concepts it manipulates, no clear definition of the question framework.

- [Causal infrence on EHR to assess blood pressure treatment targets: an application of g formula, Johnson et al., 2018](https://www.worldscientific.com/doi/abs/10.1142/9789813235533_0017)

- [Broadening the reach of the FDA Sentinel system: A roadmap for integrating electronic health record data in a causal analysis framework, Desai et al. et Schneeweiss, 2021, Nature DJM](https://www.nature.com/articles/s41746-021-00542-0) : high level view on the topic, good separation between pretreatment/posttreatment. Not tutorial like or data focused. Could benefit from a study with practical use case.

- [Targeted learning with daily EHR data, Sofrygin et al., 2019](https://onlinelibrary.wiley.com/doi/full/10.1002/sim.8164?casa_token=jRtYLm6A6x4AAAAA%3ATVFbqpfAQ8EJrdHtS1ZJdOJTAYW6eyNZVGzlojnV2CYHvBtYD9qVzb1fhR5FVedfMvGwpPkSXI1US_M) Dynamic regime, but a part on "long-format" data that might be really interesting for me. They also analyze different coarsing of the data [90, 30, 15, 5] day intervals. It does not seem to make a lot of differences between the intervals when looking at figure 2 on survival: At least for the ordering of the regime, except for the d7.0 which is is permutated in term of survival between time unit = 90 days and time unit = 5 days. This result is consistent between a non parametric TMLE superlearner and a parametric regularized logistic TMLE. 

- [Comparative Effectiveness of Fludrocortisone and Hydrocortisone vs Hydrocortisone Alone Among Patients With Septic Shock , Bosch et al., 2023](https://jamanetwork.com/journals/jamainternalmedicine/article-abstract/2802801?casa_token=YPnLJofNhn4AAAAA:8CCuMqo-arIMugQMKKzq_KrxSt5Lm9Ym1SS0aw-qYYFbJTu0y-bIgGhIWh7tJtIjbjWcib9ewLk). Using claim data, they emulate the trial by looking at allocation of treatment during the first . They do a sensitivity analysis with 24 firts hour of the stay only. 

- [Targeted Behrt: Deep Learning for Observational Causal Inference on Longitudinal Electronic Health Records](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=9804397)

They study if Behrt can be used for treatment effect estimation in CPRD dataset, with a semi-synthetic simulation (modeling the outcome only) and a real use case. The use case is the differential effect of 5 classes of hypertensive drugs on cancer incidence.   

The comparison to other models (BART, LR, TMLE with LR) seems quite unfair
because these later does not have any time-varying confounders, only 40 binary
aggregated diagnoses codes. It seems to strongly disfavor them compared to the
deep learning models which takes dynamic diagnoses from both primary and
secondary care, medications, systolic blood pressure (BP) measurement. Also
there is absolutely no sensitivity analysis and very poor discussion about the
use case results.  

### Already read, more notes

#### [Hernán, M. A., Hsu, J., & Healy, B. (2019). A second chance to get causal inference right: a classification of data science tasks. Chance, 32(1), 42-49.](https://www.tandfonline.com/doi/full/10.1080/09332480.2019.1579578)

Not agree with its view on RL where he claims that the mechanisms are known by the algorithm : IMHO, they are not, the algorithm is learning them via the value function. However, it has access to numerous repetitions of the game through simulations that allow him to learn over the whole space of possible states, preventing low overlap situations.
To be fair, all relevant variables of the game are logged (relevant w. respect to the issue of the game, aka the outcome), so there is no residual confounders.

#### Tutorials


### [Singh, R. (2019). Causal inference tutorial. Technical report, MIT Economics.](https://economics.mit.edu/sites/default/files/inline-files/causal_tutorial_1.pdf)

Too theroetical, not enough applied, not enough content on temporal data.

##### [ICML 2016, causal inference tutorial, Shalit et Sontag](https://docplayer.net/64797211-Causal-inference-for-observational-studies.html)

- A bit too basic on causal inference, but very pedagogical and progressive.
- Plan:
  - Prediction is not causation
  - Need for observational studies with various examples: advertising, training for job market, precision medecine, discrimination, kindergarten ...
  - Assumptions
  - Identification (matching, G-formula, IPW, Doubly robust)
  - Causal graph, backdoor-criteria
  - checking assumptions: ignorability with non missing confounders (topic literature), missing outcomes/treatment ?, no post-treatment variables included, overlap checks, sensitivity analysis by dropping variables for either outcome or treatment models (see [Hsu & Small, 2013, does cigarette smoking increase blood lead]()).
  - link with off-policy RL
- Intersting view on matching as a G-formula with two 1-NN classifiers.

##### [Sharma, Amit (2018). Tutorial on causal inference and counterfactual reasoning](https://causalinference.gitlab.io/kdd-tutorial/)

- A bit less intuitive than Shalit et Sontag, but the same plan more or less. Begins with classical framework introduction and DAG (coming later in Shalit tutorial).
- More content on IV and discontinuity designs
- Intersting content on refutation based on [dowhy refutations](https://www.pywhy.org/dowhy/v0.9.1/example_notebooks/dowhy_simple_example.html#Refuting-the-estimate)

#### [dowhy medical example](https://www.pywhy.org/dowhy/v0.9.1/example_notebooks/gcm_counterfactual_medical_dry_eyes.html)

The treatment and outcomes are already defined, there is only one confounder. This is more like a practical example of using their library than a tutorial, mentionning potential pitfalls. 

#### [Replication of a study on mimic-iv](https://github.com/alistairewj/mimic-iv-aline-study/blob/main/mimic_iv_aline.ipynb): Replication on Mimic-IV of the study

> Hsu DJ, Feng M, Kothari R, Zhou H, Chen KP, Celi LA. The association between indwelling arterial catheters and mortality in hemodynamically stable patients with respiratory failure: a propensity score analysis. CHEST Journal. 2015 Dec 1;148(6):1470-6.

After exclusion of 19583 readmission, 5670 shortstay, 22518 vasopressors, 20924 septic, 11888 aline be fore admission (??), 50 257 not ventilated during first 24h, 18550 going to surgery, it remains 2739 patients in the final cohort.

Then variable extractions within a big SQL query, very small correction on the data (negative mortality dates to NaN).

Then selection of counfounders (small part), no discussion on this, but this should be given in the paper.

#### [Smith, M. J., Mansournia, M. A., Maringe, C., Zivich, P. N., Cole, S. R., Leyrat, C., ... & Luque‐Fernandez, M. A. (2022). Introduction to computational causal inference using reproducible Stata, R, and Python code: a tutorial. Statistics in medicine, 41(2), 407-432.](https://onlinelibrary.wiley.com/doi/pdfdirect/10.1002/sim.9234)

Nice inspiration and [notebooks](https://github.com/migariane/TutorialComputationalCausalInferenceEstimators/blob/main/PythonCodeBoxes.ipynb), but from the beggining, we have a nice table with target and covariates. We loss completely the importance of the preprocessing step and the question formulation step. This is very far from real life and does not allow for sensitivity analysis, either on the question side, or on the counfouders side.

#### [python-for-epidemiologists](https://zepid.readthedocs.io)

It might be the more complete and practical guide existing with several demonstration of biases in [a serie of notebooks following well Hernan's book](https://github.com/pzivich/Python-for-Epidemiologists)

It get a bit lost in the documentation, but there are very good explanations on :

- [Time fixed exposure](https://zepid.readthedocs.io/en/latest/Time-Fixed%20Exposure.html)
- [Time varying exposure](https://zepid.readthedocs.io/en/latest/Time-Varying%20Exposure.html)

A lot of content, no considerations on the variable transformations and small considerations for the question of interest. No temporal bias at the question formulation step. 

### Read, but not relevant

#### causal inference with ehr


- Do I have to add some ICU and ML specific stuffs such as:
  - [Eini-Porat, B., Amir, O., Eytan, D., & Shalit, U. (2022). Tell me something interesting: Clinical utility of machine learning prediction models in the ICU. Journal of Biomedical Informatics, 132, 104107.](https://www.sciencedirect.com/science/article/pii/S153204642200123X?casa_token=Ze-Xfj4FWCUAAAAA:qnJS2p4Opc9mMrpCC3tnALTO69_gqK3pgCIbLcIYf0ALDCrCNrxvJC0iLNHoz93WRU0tSWxMrlg)
  - [Gutman, R., Aronson, D., Caspi, O., & Shalit, U. (2022). What drives performance in machine learning models for predicting heart failure outcome?. European Heart Journal-Digital Health.](https://academic.oup.com/ehjdh/advance-article/doi/10.1093/ehjdh/ztac054/6732528)

- [hatt2021sequential](https://arxiv.org/pdf/2104.09323.pdf) studied
"decounfounding" (change the term, I don't like it), for sequential data,
illustrating their work with MIMIC on 1) vassopressors and (2) mechanical venti-
lators over time on three patient outcomes: white blood cell count, blood
pressure, and oxygen saturation. However, they validate their work only with
outcome Mean Squared Error, which is not an approriate measure of ITE.

- [Komorowski, M., Celi, L. A., Badawi, O., Gordon, A. C., & Faisal, A. A. (2018). The artificial intelligence clinician learns optimal treatment strategies for sepsis in intensive care. Nature medicine, 24(11), 1716-1720.](https://www.nematilab.info/bmijc/assets/102418_paper.pdf) RL for optimal treatment of sepsis wiht intraveinous fluids or vasopressors. Hard to grasp how they evaluate their policies (IPW I think). They seem to say that too much fluid is associated with increased mortality. Is there a result on this ? 

#### Previous MIMIC datathon in Technion: [Sobel, J. A., Almog, R., Celi, L. A., Gaziel-Yablowitz, M., Eytan, D., & Behar, J. A. (2022). Building Trust: Lessons from the Technion-Rambam Machine Learning in Healthcare Datathon Event. arXiv preprint arXiv:2207.14638.](https://arxiv.org/pdf/2207.14638.pdf)

Not causal or applicated enough IMHO.

Organized in March 2022 at Rambam hospital. 50 participants. The paper gives an intresting view on Israël health system: I learned that there is a data exchange format (called Ofek) as  well as a bog data platform for neutral access to data (TIMNA).
Clinicians were contacted in advance to propose 4 projects:

- prediction of newborn birthweight by maternal parameters and previous siblingsh birthweight
- prediction of bloodstream infections during hematopoetic stem cell transplants
- prediction of recurrent hospitalization in heart failure patients
- risk factor and severity prediction in hospitalized COVID-19 patients

Each Db was presented with a 2GB database focused on structured data (no images, text, nor time series). The data was processed on AWS: miniam 8-core, 16GB machine by team w available extension during the event. The teams could access and setup their env 2 weeks before the events. Then second phase of schema exploration.


#### Don't add some ICU and ML specific stuffs such as:

- [Eini-Porat, B., Amir, O., Eytan, D., & Shalit, U. (2022). Tell me something interesting: Clinical utility of machine learning prediction models in the ICU. Journal of Biomedical Informatics, 132, 104107.](https://www.sciencedirect.com/science/article/pii/S153204642200123X?casa_token=Ze-Xfj4FWCUAAAAA:qnJS2p4Opc9mMrpCC3tnALTO69_gqK3pgCIbLcIYf0ALDCrCNrxvJC0iLNHoz93WRU0tSWxMrlg)
- [Gutman, R., Aronson, D., Caspi, O., & Shalit, U. (2022). What drives performance in machine learning models for predicting heart failure outcome?. European Heart Journal-Digital Health.](https://academic.oup.com/ehjdh/advance-article/doi/10.1093/ehjdh/ztac054/6732528)

#### Causal inference with Mimic, but problem is ill posed

- [Wu, C. S., Chen, P. H., Chang, S. H., Lee, C. H., Yang, L. Y., Chen, Y. C., & Jhou, H. J. (2022). Atrial Fibrillation Is Not an Independent Determinant of Mortality among Critically Ill Acute Ischemic Stroke Patients: A Propensity Score-Matched Analysis from the MIMIC-IV Database. Frontiers in Neurology, 12, 2609.](https://www.frontiersin.org/articles/10.3389/fneur.2021.730244/full) : no treatment studied.

- [Ranganath, R., & Perotte, A. (2018). Multiple causal inference with latent confounding. arXiv preprint arXiv:1805.08273.](https://arxiv.org/pdf/1805.08273.pdf) : Complicated with multiple treamtent estimation, no confidence bounds or sensitivity analysis.

- [Huo, Y., Wang, X., Li, B., Rello, J., Kim, W. Y., Wang, X., & Hu, Z. (2022). Impact of central venous pressure on the mortality of patients with sepsis-related acute kidney injury: a propensity score-matched analysis based on the MIMIC IV database. Annals of Translational Medicine, 10(4).](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8908183/): high and low CVP groups as factor of risk rather than treamtent is studied.

- [Liu, R., Yin, C., & Zhang, P. (2020, November). Estimating individual treatment effects with time-varying confounders. In 2020 IEEE International Conference on Data Mining (ICDM) (pp. 382-391). IEEE.](https://ieeexplore.ieee.org/abstract/document/9338265/authors#authors): Dynamic treatment regime stuff, the treatment question seems ok, but not enough detail to be sure in the paper. Moreover, they say that the usual causal inference methods don't look into confounding variables which seems strange and a very unfair comparison to me. No sensitivity analysis with simple pivoted time varying confounders plugged into ML models. 

- [Nevoret, C., Katsahian, S., & Guilloux, A. (2022). Debiasing the estimate of treatment effect on the treated with time-varying counfounders. arXiv preprint arXiv:2204.03447.](https://arxiv.org/pdf/2204.03447.pdf) (Heka team) Study on dynamic treatment by vasopressors on death. Not included because time-varying estimand. 

## Ideas

### Replicate Alistair Johnson study (not very interesting since no effect and no RCT found.)

### Tristan commentaries: 

- Does it exists ? if yes, how to position ? If no, why ? 
- The example might not be perfect but why not. It is probably the second use of medical brain imaging though.
- Find a second example where the effect is known and relatively large (eg. RCT). 
- What journal ? 

### Study flow diagram:

dowhy or econml are too ML oriented, lack a common thread to follow for both clinicians and engineers, a more applied graph such as [this one](https://econml.azurewebsites.net/spec/flowchart.html) would be intersting. 

### Motivation

Give more examples, going in more diverse fields (public health, icu, environmental health, education...)

### A second known use case 

The second example should be focused on a well known effect (RCTs known). It should break the analysis once or twice to show effect of well known errors. 

From the already existing studies in Mimic, Tristan was more into the following (see details in main doc): 
  - liberal vs conservative oxygenation : should be a paper in new england
  - high flow oxygen therapy(high-flow nasal cannula) vs. noninvasive ventilation (NIV)
  - restrictive IV fluid administrated for patients with severe sepsis and septic shock 


### Notations should be introduced as well as causal graphs

### Cite useful packages

- [econml](econml.azurewebsites.net/)
- [dowhy](https://www.pywhy.org/dowhy/v0.9.1/)
- [zepid](https://zepid.readthedocs.io/)

### Biases

- Important Idea: Choice of study design outweighed specific methods choices

- In section:1.4 I frame the question: Use of dag to prevent temporal biases (immortal, lead time).
  - Lead time bias: not trivial to understand it trough a dag. More easy with a time diagram.
  - Immortal time bias: A paper by [Mansouria et al., in International Journal of Epidemilogy](https://academic.oup.com/ije/article/50/5/1405/6333514) seems to explain this well, but it remains quite involving to understand it well.

- Are there non temporal colider biases ?  Look into the details of [Endogenous Selection Bias: The Problem of Conditioning on a Collider Variable](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6089543/) which gives dag with pretreatment coliders in figure 13. Yes, it easy to find some non-temporal coliders if we introduce latent variables. I found [simple examples there](https://mixtape.scunning.com/03-directed_acyclical_graphs).

- Hernan has many more papers on [temporal bias](https://www.hsph.harvard.edu/miguel-hernan/research/causal-inference-from-observational-data/):

#### Selection bias (in the cohort construction)

- [Healthcare utilization is a collider: an introduction to collider bias in EHR data reuse, Weiskopf et al., 2023, JAMIA](https://academic.oup.com/jamia/advance-article/doi/10.1093/jamia/ocad013/7031302)

Reference to [the notion of cohort](https://academic.oup.com/jamia/article-abstract/21/2/221/2909214), and the non-random missingness of inclusion criteria (such as diagnosis code) as a potential collider source.

A bit focused on claims (care utilization depends on social determinant which is thus a colider when definiing the cohort and induces selection bias). This might be less true in EHR data where the population is selected by systematic biology or measurements.

- **Mention dags**: pearl ideas on spurious path and colider, simpson paradox (hernan unraveling simpson  paradox?), use a dag to illustrate counfounders AND coliders (with [dowhy](https://www.pywhy.org/dowhy/v0.9.1/user_guide/)). Maybe the identification algorithm given a causal graph [Shpister, Pearl, 2006](https://cdn.aaai.org/AAAI/2006/AAAI06-191.pdf). Also mention nice [summary of dag here](https://nickchk.com/causalgraphs.html). 

### Outcome immortal time bias

[Hernán MA, Sauer BC, Hernández-Díaz S, Platt R, Shrier I. Specifying a target trial prevents immortal time bias and other self-inflicted injuries in observational analyses. Journal of Clinical Epidemiology 2016](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5124536/)

4 examples of wrong time zero alignment:

He distinguishes the Eligibility time E, the Assignment time A, and the T_0 time of followup start.

- Patient are assigned after E but before the T_0 (selection bias). This seems to corresponds to the lead time bias in the dialysis inititialization paper.
- Patient are assigned A before E (which is at the same time as T_0), (selection bias)
- Patient are assigned A before E and E is after T_0 (immortal time bias introduced)
- Patients are assigned A after E and E is after T_0 (immortal time bias introduced)

These bias are often introduced with the following justification, for which Hernan gives some advices:

- **Time zero is hard to define** (eg. inclusion happens several times): the easiest way is to choose on of them at random or the first one. Or run nested trial by including multiple a person, but more delicate and needs variance adj. A mixed approach can be used with first inclusion for treated and random time for control as in our study on Brain imaging.

- **Individuals do not adhere to sustained treatment strategies**: censor the individuals when they discontinue the treatment if per-protocol effect (instead of itt). Then reweighting is needed to adjust for additional confounding added by this censoring (IPW preferred by Hernan).

- **Multiple choices of assignment for a patient**: randomly assign to a strategy or clone and variance adjustement. This is especially true, when the treatment depends on some time varying biology (initiate if hemoglobin drops below 10g/dL).

- **Too few treated patients**: consider doing a continuation vs discontinuation analysis where prevalent medication users are included. Or if too few initiate at time zero, a grace period could be used. But this issue raises once again immortal time bias, so cloning/censoring is needed.

### Outcome time zero at treatment initialization

- [Hernán MA, Robins JM. Observational studies analyzed like randomized experiments: Best of both worlds. Epidemiology 2008; 19(6):789-792.](https://www.jstor.org/stable/25662637) which is a response to the initial paper on [experiments: an application to postmenopausal](https://dash.harvard.edu/bitstream/handle/1/41292846/33102%20aam%20nihms492814.pdf)

Response : Does a combination of estrogen and progestin increase CHD risks for woman with menopause ? Discrepancies between RCT of WHI which found increased risk (not signficant) and Nurses' Health Study (observational) which found significant protective effects. It seems to be due to HTE in the effect depending on the age for treatment initialization.  Three biased are discussed: misclassification (ie. selection) bias with T0 being set up until 2 years after treatment initialization, confounder bias for healthier initializaters, and confounder bias for healthier continuer. They deal with the first bias by setting properly the time zero of followup. The two subsequent biased are adressed by a ITT analysis. The paper also favor survival curves over HR because it separates better the treatment groups for effects limited in time (at the beggining of the curve). 
