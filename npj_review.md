## Associate Editor (Remarks to Author):

Thank you for your submission to the journal. I have now read the manuscripts and received two peer reviews. The reviews generally agree that the area is of interest and offer a range of constructive suggestions covering some major and minor issues in the manuscript, as well as some tricky conundrums facing the field in general. I hope these comments are useful for revising the manuscript and interesting directions for advancing the area.

*Gael: Very positive general comment, considering that the manuscript was
rejected*

## Reviewer #1 (Comments to the Author):

The paper emphasizes the importance of causal thinking in healthcare, focusing on routinely-collected data like EHRs and claims data. The authors present a step-by-step framework to build valid decision-making from real-life patient records by emulating a randomized trial. They illustrate their approach by studying the effect of albumin on sepsis mortality in the Medical Information Mart for Intensive Care database (MIMIC-IV). In all, I would recommend a rejection of this paper, although the authors should feel free to resubmit at any time and consider improving the paper upon several pathways listed below.

On the good side, the paper is well-structured and provides a comprehensive guide to causal analysis of EHRs. It addresses a critical need in healthcare decision-making by emphasizing the importance of causal thinking and providing a practical step-by-step framework. The comprehensive framework is an advantage, with firstly identifying a treatment effect question and the causal graph, then estimating the causal effect with various estimators, and lastly evaluating the robustness of hypotheses and consider subtle impact on certain subgroups. The authors also openly provide code and data, with a nice case study on albumin on sepsis mortality.

However, one must point out that there are also several key questions unaddressed in this paper, which are largely unignorable. First of all, with the claim that machine learning cannot provide optimal healthcare while decision-making with causation can, it is vital to discuss some examples or papers to support it. After that, the causal framework must show how it can work with accurate predictions to help clinicians. Currently, there lacks discussion on how accurate predictions and causal analyses collaboratively help make decisions, even though it is important in the real practice. Causal analyses alone to this extent may not be sufficient, considering that the paper focuses on helping decision making, due to various reasons—some of them will be listed below.

*Gael: Need more emphasis on this, probably close to the intro (eg a
sentence in the intro stressing that these things do happen in real life,
and right after the first paragraph of section 2, with evidence of such
failures, as well as in the discussion)*

The causal analysis used in this paper is grounded on the current causal inference theory for sure, and the expert knowledge is leveraged to construct the causal graph. However, it is still important to discuss the flaws with causal inference theory (too strong assumptions on ignorability and strong priors on causal graph, etc.) and its impact on the case study here. Without guarantees on the minimization of these impacts, the causal analyses on Electronic Health Records will be unreliable just as machine learning essentially.

*Gael: I only partly agree: I think that for predictive models an
imperfecrt causal framing is useful. We should mention and demonstrate this, ideally. Maybe we should also do small touches at the vibration analysis part + how it's referenced in the discussion to explore more the sensitivity analysis framing in the sense of causal analysis*

In the ML community, there are also many emerging papers such as [1-5] on incorporating causality and ML, which are not mentioned whether these practices can be of good solutions and what distinguish this paper from those papers. Considering that, there are also not enough citations if the paper has a focus on causal analyses to make up for machine learning as described in the abstract. Or, if the paper does not explicitly discuss the implication for AI/ML/accurate prediction and change the scope, it would be fine not to mention these papers.

*Gael: I did mention a review paper on these. I don't want to expand too
much on this, because I think that rushing to a complex solution is not
helpful when people do not even understand the problem.*

**Suggestion** *(hopefully useful for several comments above): in the discussion, we add a paragraph stressing failures of a variety of predictive models, failures that have not been revealed by the evaluation of the models. We stress that the first problem here is that investigators framed their study without accounting for a proper interventional strategy, and hence not only the model was wrong, but the evaluation was wrong. Given a proper framing, a proper evaluation, and an adequate structural model, one can go even further than training a standard predictive model, and uses causaly-informed ML, cite X, X, and X*

In the case of albumin, the authors mentioned that the results in the literature can be conflicting with each other. It is vital to show how the method proposed in this paper could end the conflict and give a more persuasive result, otherwise the finding is simply adding tools to analyze the problem without significant confidence, and these tools (with every step mentioned in Fig 1) are already known to the medicine community—making this paper more of a review of existing tools organized in a good manner to just be comprehensive. Therefore, I believe more concrete results are needed to highlight the contribution of this paper for publication.

*Gael: yup, that's probably the most important comment of the review. We
should do this, and add a bit of importance of this in the abstract
(mention specificaly the albumin, the mistake and the solution)*

The authors also admit that the success of causal analysis relies on data. MIMIC-IV is of course a good open-source dataset, but it is also far from being representative of all domains of EHR. MIMIC-IV is of ICU patients in Israel alone, with potential selection biases, data quality and quantity (not all patients in MIMIC-IV have sepsis) issues and others. It will be much more valid if the paper considers analyzing albumin on specific datasets for sepsis, with probably more comprehensive modalities of information. The current illustration on MIMIC-IV, without ending the conflict (distinguish from existing methods or papers) or providing convincing results (on comprehensive dataset), seems not good enough.

*Gael: don't do, in the interest of time*

Some typos: Section 4, "Yet, if the EHR data does no contain this information" should be“Yet, if the EHR data does not contain this information”. "Operator Characteristic (ROC AUC). In the contrary, a model trained on pre-treatment features yield competitive performances." - "In the contrary" should likely be "On the contrary".

[1] https://doi.org/10.1016/j.patter.2023.100828
[2] https://ieeexplore.ieee.org/abstract/document/10027709
[3] https://ieeexplore.ieee.org/abstract/document/9804397
[4] https://www.nature.com/articles/s42256-020-0197-y
[5] https://www.nature.com/articles/s41598-023-38858-4




## Reviewer #2 (Comments to the Author):

The authors have taken a good stab at formalising language and framework for causal inference on EHR. However, there are several questions that need some answers including the following primary one: As there are many frameworks for causal inference (some for real world evidence studies /observational studies indeed), what is the utility of proposing another framework and how does this framework address outstanding issues in previously articulated frameworks? This is necessary for clarification and I believe while this work is a good pilot study into looking at causal inference/causal analyses of EHR, further details of the justification for the framework, in-depth look at various types of EHR, and other forms of comprehensive review is needed to fully capture the presented thesis.

*Gael: We will need to do a bit more on this. But it requires thinking,
as we had already written the words.*

Here are section-by-section comments below:

Intro:
1) Reference to “target trial” needed – Hernan’s work might be good here…

*Gael: adding a reference is really something to be done: it's cheap in
terms of words and reader attention.*

2) Very nice summary of the framework for causal inference and whatnot here

3) I see that there are many frameworks that already exist for causal inference. What are the concrete additions that your paper puts forth. This is unclear. What are the contributions? Some more nuance of time-varying features – ok, but please do write what these are with clarity at the end of intro section. In some more words, what is the need for this paper? What are the shortcomings of the Hernan’s work on emulation of targeted trials for example as Hernan et al present a beautiful framework for conducting such emulations. How about the potential outcomes framework? Are they lacking something that this paper will add? Great please elucidate and this can be gripping; as of right now, I am not clearly seeing the value of the contributions in this paper. One more framework to throw into the mix is not necessary; there are enough of them out there.

*Gael: the reviewer is being a bit defensive in the academic style here.
I guess that the right way to adress this is not to write an addition
sentence saying "the specificity of our framework is to account for
time...", but rather to 1) show the importance of such settings (ideally
with numbers, to convince), 2) show how easy/how often problems arise
from not accounting well for time-based features of the data. Ie don't
explain once again the specificity of our framework, but frame why these are
important.*

Step-by-step framework for robust decision making from EHR data
1) I did not understand the illustrative example in the beginning: so you fit a model on “clincal measures available during the first 24 hours after admission”. But why is this done? as in, if we are looking at 28 day mortality window after icu admission, why would one ever use the first day’s data ( i.e. , the first day of 28 prediction window) to train the model? one would never adjust for things in the follow-up window as these may be post-baseline covariates that has happened after start of study of outcome window as opposed to before… (collider adjustment bias/ problem in a causal setup) It is unclear to me and I am not understanding why this motivating example is necessary here… please explain.

*Gael: classic mindset problem: the review is from a public-health,
causal analysis background, and says "this is stupid, all my friends no
very well that one shouldn't do this", while he is just sitting in his
filter bubble. We need to demonstrate that the problem happens a lot in
the wild. If we have good references, add a sentence like "To an clinical
expert, adding post-treatment variables is a no-no. However, such a
mistake is actually easy, [cite good examples of these mistake] "*

2) Great summary of biases but not comprehensive as this is supposed to guiding documents. Please justify why immortal time + selection bias was chosen for explication above others…

*Gael: we should either consider adding other biases or have in mind why
specifically these.*

3) Please order the images in appropriate order, hard to read when we have to jump in ordering – e.g., figure 4 is referenced I believe after figure 5/6?

*Gael: what a nasty remark. Many manuscripts are submitted with images at the
end. However, this illustrates an important point: small presentation
details and manuscript readability matter a lot on the way a reviewer
appreciates a manuscript.*

4) In terms of citing guidelines, I think RECORD is very good for observational studies – please see equator network checklist and include this information please somewhere

*Gael: let's cite these*

5) In step 2 identification – one important thing is to also elucidate: how do we know we have chosen confounders appropriately? Is there a way to not over adjust or under adjust? Are we ever at risk of over-adjusting with routine clinical EHR as this is the focus area? Some papers by Rao et al (European Heart Journal, IEEE NNLS) for example show that confounder selection in a conventional way is limited and deep learning driven automatic capture of the confounding space (e.g. using transformer models like Targeted BEHRT) may be more powerful for estimation of treatment effect/association… This discussion would be important to this section as the divergence in conventional and contemporary methods begins here.

*Gael: let's stay away of the magic technical solution of deep learning
to automatically solve the problem of structural model definition. I
think here, this comment echos a comment by the first reviewer. We
probably need to mention that the selection can be imperfect, and refer
to the vibration analysis and discussion part on this.*

6) Right now we are going through the classical way of conducting causal inference – 1) frame the question, 2) choose the variables, 3) do some adjusted modelling in some way – graph or regression or propensity score method etc – 4) evaluate in terms of desired estimand. Is this the only way to go about causal inference? There are more data guided ways such that step 2’s contribution to the pipelines is atleast in-part mitigated. Please provide some perspective on this.

*Gael: no, let's avoid causal discovery, ie finding the causal variables
from the data. It is not reliable in real life; I want to avoid having to
discuss on this, as I will be negative and that's not a good thing.*

7) As there is divergence in philosophy of confounder selection (expert guided or model guided) at least to some extent, perhaps this divergence should be noted in the main graphic figure 1.

*Gael: same comment as above: let's avoid this.*

8) Confounder aggregation is a nice portion of the text presented and generally presented quite well. Please further explain why the following is the case: “However, it also increases the number of confounders, resulting in a larger covariate space, hence increasing the estimate’s variance and endangering the positivity assumption.” Any citations would be welcome as well as intuition. Is this true of all models or statistical only and not contemporary AI models?

*Gael: ok, we need to be more didactic. I'm quite surprised that a
reviewer advocating from complex methods is not atuned to these problems,
but it shows the mindset of some people focused on very rich models and
data. The challenge here is going to find a good citation as the bias
variance problem can be subtle. There are notions of "benine overfitting",
and settings in adding redundant variables actually decreases the
variance of prediction models. With regards to overlap, I think that we
can have a strong claim, and maybe the D'amour paper is the important
argument. We can add a footnote expending on it.*

9) Estimation is a bit of a quick review of the estimators used for adjusted modelling. What is the intention for this section that is novel or merits relaying? Right now, it’s a quick review but I don’t believe this sort of review is appropriate for this paper…

*Gael: interesting that the reviewer sweeps away this section. I fear
that he or she does not see value in the tutorial aspect.*

Application section

Application section broadly makes sense based on the framework set up. However, the issue is I am not sure why the framework is unique or a novel contribution. Perhaps it addresses things that is missing in the causal inference literature and fills the gap in research and thought, but I cannot see it immediately. Also, on the point of confounder selection – what happens when the full DAG is not known? What do we do?

*Gael: here the reviewer is killing us. What the reviewer is telling us
is that he or she doesn't value the paper, as it does not see it as
"unique or novel" and doesn't see how it addresses gaps in the
causal-inference literature. I think that the problem is that the
reviewer assumes that everyone should have read the causal literature. In
practice, this is just not the case. The only way around this problem is
to not have a such a reviewer. We need to be careful about our choice of
venue and suggested reviewers: experts of causal inference may actually
be counter-productive reviewers*

Great that the results of the RCT matched the observational study presented. This is good news and safely secures the experimental component of paper. However, if RCT is needed to validate the findings, then how do we use the observational study to transform clinical findings? The rct already exists so population level understanding is available in RCT or meta analysis of RCT – no need of observational studies. Not sure if the subgroup level needs to be validated first… So overall not sure the path from observational study to clinical impact.

*Gael: we really need to frame more on CATE; which is crucial for
individual decision making*

In the case of selection biases too, there is an important form of confounder called as the confounder by indication which ruins a lot of observational studies… how can we mitigate such biases? I feel that this is important enough that it needs to be addressed in such a framework – at least a heuristic and/or some more quantitative metric for illuminating effect/impact of such confounding elements

*Gael: do we have reasons to think that this will be particularly present in EHRs compared to broader settings? If so, we should add it. If not, let's leave it aside.* 

*Matthieu:* Confounding by indication seems to be ill-defined and used instead of clearer concepts such as *confounding by severity*, *confounding by selection* (https://academic.oup.com/aje/article/149/11/981/82955?login=true): An example where it almost uniquely cites example of severity: https://jamanetwork.com/journals/jama/fullarticle/2576568, an example of confounding by selection is cited here in the impact paragraph: https://catalogofbias.org/biases/confounding-by-indication/
I have difficulty to distinguish confounding by indication from simple "confounding", so I am not in favor to add it. Or if necessary, say that disease severity is an important confounding, sometimes referred to as "confounding by indication".


Conclusion

“Without causal thinking machine learning does not suffice for optimal clinical decision making for each and every patient. “ à this is not true so please remov. there is a lot of decision making that is for a fact conducted without causal inference modelling or causal “thinking” modelling. Let’s take a look at cvd preventative therapy recommendation. This is done via risk prediction modelling – has nothing to do with the causal effect – and yet a predictive model and predicted risk via a traditional cox proportional hazard model is all is needed to guide decision making i.e., in this case a preventative therapeutic recommendation.

*Gael: Let's rephrase this sentence in "without causal thinking, machine
learning risks not being enough for optimal decision making for each and
every patient." The reviewer's point is that in case of pure
preventation, prediction is sufficient (that's a point that we are trying
to bring forward in our other paper). Does it risk perpetuating
inequalities even in pure prevention settings? I'm actually not sure that
the framework applies, because in pure prevention settings, a model
may not cover the potential intervention: the outcome of interest is not
post-treatment. It may however be useless without causal thinkink,
because it may capture information consequence of a diagnosis: I predict
that an individual is likely to have a cancer based on the on-going
chemiotherapy. I wonder whether we should add such a discussion here. The
danger is to go on a side-track that drowns the messages of the paper.* 

Continuing on: “It will replicate non-causal associations such as shortcuts improper for decision making” . Again not true. In fact models like score2 and Assign and other models are statistical models and are used for decision making and DO NOT utilise shortcuts for decision making. i.e. by adjusting for variables after the start of follow-up. Still not sure the point of the motivating example at the beginning of the paper.

*Gael: let's investigate these models. I don't understand what the
reviewer is getting at. Apparently we have annoyed the reviewer. We could
use more nuanced vocabulary "It can replicate non-causal associations".
The reviewer is going back to the example of the beginning of the
paper, in a sense saying "nobody does those mistake", but the point being
that people we don't do those mistakes have some causal thinking. Maybe
we should write somewhere that the causal thinking may alread be present
in some studies though only implicit, via a good understanding of the application. Yet, a clear framework helps making sure nothing falls through the cracks.*

*Matthieu* These scores indeed do not rely on post-treatment as they are
developed only on patients wo cardiovascular disease and statin as baseline (see. https://www.bmj.com/content/357/bmj.j2099).
Note that this is true only if we consider that statin is the first and only
treatment which is not the case: qrisk are also used to engage patients for
cardio-protective risks and physical activity, strongly recommended before
statin therapy.

“they risk propagating biases when building AI models which can further reinforce health disparities. “ Not sure about this too. For example race (or patient sex) is a factor that might be worth adjustment when considering some exposure-outcomes associations. For example race might (at least) be a proxy for some unadjusted confounding which is important to adjust otherwise one might face issues of uncontrolled confounding in association modelling…

*Gael: the reviewer is quite a contrarian, there is a body of evidence on
the problem, he just chooses not to be interested. Let's repeat the citations of the beginning here and move on.*

Overall, a stricter and more accurate vocabulary for defining confounding, bias, association estimation, and other key details for causal inference in general must be used in the paper. (some good papers on this: https://academic.oup.com/aje/article/166/6/646/89040, https://www.jstor.org/stable/29717084). There needs to be more discussion of ML methods as this is a key takeaway in the conclusion section. I do not see high-end DL methods explored such as tarnet, dragonnet, or more pertinently, the targeted behrt method for high dimensional EHR. At least a discussion of such methods is necessary to complete the work.

*Gael: as mentioned above: let's not go this direction.*

Furthermore, a comprehensive examination of what research questions are appropriate for what type of EHR data is needed. Eg we need more dense measurements are needed when conducting inference in the minute-scale… However, perhaps less dense measurements are needed when considering inference in year scale? Also, what happens when recordings are delayed which is often a concern (issues of reverse causation is quite the issue)? Is inference possible? How do we deal with this? This paper could benefit from a healthy review of the intersection of the benefits/limitations of routine clinical data and causal inference methods. 

*Gael: the delay in recordings is a really interesting remark. I have
faced this problem in the past. Maybe we should add this as a source of
bias (ideally with a good reference). With regards to more details on
which data for what, I would rather not: I don't want to make the
manuscript too long*

