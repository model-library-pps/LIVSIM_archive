**Name**\
LIVSIM

**Program type**\
MATLAB 7.12.0 (R2011a)

**Available since**\
Fri, 03/23/2012 - 12:00

**Description**\
Instruction for running LIVSIM

**Software**\
The model runs with Mathlab software and is tested with the version 7.12.0.635 (R2011a). For staff of Wageningen University: This version can be installed on your computer with the WUR application to install software.

**Preparation for runs**\
Some of the files have to be manually changed to select options for management, i.e. feeding regimes.
These feeding regimes are given in the ‘feed_input.xls’ file (see column with animals class; here you find class of lactating cows with three different diets in the dry season (4=control (current diet); 5=supplemented (diet supplemented in dry and hot months); 6=kept in stable (during dry and hot season)). To select the management strategy you need to change the diets in the file ‘Run_livsim_scenarios.m’. How to do that is explained at the top of that file. If you wish to simulate potential performance you better safe the ‘feed_input pot.xls’ as ‘feed_input.xls’ file. Do not forget to safe the file ‘feed_input.xls’ with another name to keep it for next time you want to run the other feeding strategies again.
With change in feeding strategy you also need to make changes in the files ‘cow.txt’ and LivesimMGMT.txt both in the directory LIVSIM\Input. According to feeding strategy we assume that the calf we start with, is born form a cow that has experienced the feeding regime over its own life cycle. Thus with lower quality and quantify feed the birth weight (= starting weight of the simulation) will be lower and the milk given to the calf will be lower. Related to the feeding regime is grazing or not grazing. So in the same file you need to change the distance walked depending feeding strategy.
These are the combinations of parameters I used for the different feeding regimes:
(Change Birth weight in Cow.txt and milk allowance and walking distance in LivesimMGMT.txt)
 

|                | Birthweight (kg) | Milk allowance (kg) | Walking distance (km) |	 	
|----------------|------------------|---------------------|-----------------------|
| Control        | 18	              | 780 780 0           | 6                     |
| Supplemented   | 22	              | 1050 1050 0         | 6                     |
| Kept in stable | 26	              | 1250 1250 0         | 3                     |
| Potential      | 30	              | 2450 2450 0         | 6                     |

	 
**Running**\
In the file ‘runner_ scenarios_mean.m’, you can select the number of runs with same setting. Remember that each run exist of a set of 12 runs (each of these starting at the different months of the year). So if you change ‘numberoftimes=10’ the model runs 120 times. In the same file you can change the amount of milk produced that is allocated to the calf, ‘milk_allowance=0.855’. The results shown are with for all diets milk allowance is 0.855, but it is better to change this with a lower fraction allocated to calf if diet improves.
The model is run with the command: run runner_scenarios_mean or run runner_scenarios_median