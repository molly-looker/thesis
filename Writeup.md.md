# Flow or Circus Artist/Spinner/Object or Prop Manipulator Demographics

We know who we are, but as a group, we have not unanimously decided what to call ourselves. In broad terms, this project describes people who dance with objects other than their bodies.

## Where you got your data

I knew I wanted a dataset about hula hooping (my obsession, other than data). At first, I really wanted to pull data from Google Analytics on my personal business website www.hoopla-hulabaloo.com, but after finding out that there are only about 5 non-aggregated dimensions available to Standard GA users through the API (and Premium accounts are available at a lite $150K) my dreams were crushed...Until! I went on Facebook and posted in a few groups I'm part of, Business for Flow Artists and Flowmies of Earth, asking the wild, open-ended question, "Does anyone know of where I can find public data about flow?" Within hours, I had dozens of fascinating (and fascinated) folks providing me with ideas, amongst them a flow festival promoter, who happened to give a survey to all his website visitors asking them all sorts of wonderful things that I never would have even thought of. He happily provided his anonymous dataset, and I used the Demographics Data Block from Looker Blocks to provide context for the world at large compared to this small set of spinners.

## What questions you wanted to answer with this dataset

The dataset provided its own questions - what are the characteristics and activities of flow artists? I admit, I've always been the person doing the programming to answer the questions that others asked, so I didn't go into it knowing what I wanted to find out. But as soon as I saw the data, I wanted to figure out if I could find trends and/correlations between any of the dimensions. My thesis advisor Andy was really helpful in thinking of meaningful questions, as well. Personally, I wanted to know how I fit in among my peops!

## The structure of your data and how you chose to model it in Looker

The dataset was a big spreadsheet with 50+ columns, many of which contained arrays or messy free text. I loaded the dataset into BigQuery and turned the array columns into their own tables with views. I spent a little time writing case statements to clean up slightly messy free text fields (a lot of creative spellings of "atheist"), but not a ton. The demographic data block, using American Census data, was already up in BigQuery and connected to productday, so it was just a matter of figuring out how to fit it in with my spinner demographics.

## Future questions/thoughts for this dataset
