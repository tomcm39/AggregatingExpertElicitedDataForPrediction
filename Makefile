#mcandrew;

PYTHON := python3 -W ignore

.PHONY: runall

runall: buildConsortDiagram\
	buildNumArticlesPublishedPerYear\
	buildProportionOfTop12WordsOverTime\
	buildTop5PercentWords\
	buildNumOfForecasters\
	buildNumOfForecasts\
	buildManuscript

buildConsortDiagram:
	mkdir -p ./_G/F1/ &&\
	$(PYTHON) buildConsortDiagram.py &&\
	echo "Consort diagram built"
.PHONY: buildConsortDiagram

buildNumArticlesPublishedPerYear:
	mkdir -p ./_G/F2/ &&\
	$(PYTHON) mergeArticlesAndReferenceTags.py &&\
	$(PYTHON) buildNumArticlesPublishedPerYear.py &&\
	echo "Num of Articles per year complete"
.PHONY: buildNumArticlesPublishedPerYear

buildProportionOfTop12WordsOverTime:
	mkdir -p ./_G/F3/ &&\
	$(PYTHON) proportionOfTop12WordsOverTime.py &&\
	echo "Proportion of top 12 words over time complete"
.PHONY: buildProportionOfTop12WordsOverTime

buildTop5PercentWords:
	mkdir -p ./_G/F4/ &&\
	$(PYTHON) countAbstractText.py &&\
	$(PYTHON) top5PercentWords.py &&\
	echo "Top 5 percent of abstract unigrams"
.PHONY: buildTop5PercentWords 

buildNumOfForecasters:
	mkdir -p ./_G/F5/ &&\
	$(PYTHON) buildNumberOfExperts.py &&\
	echo "Number of Forecasters Dist."
.PHONY: buildNumOfForecasters

buildNumOfForecasts:
	mkdir -p ./_G/F6/ &&\
	$(PYTHON) buildNumberOfExpertForecasts.py &&\
	echo "Number of Forecasters Dist."
.PHONY: buildNumOfForecasts

buildManuscript:
	cd ./manuscript/ && latexmk -pv -pdf aggregatingExpertElicitedDataForPrediction.tex && latexmk -C && cd ..
.PHONY: buildManuscript
