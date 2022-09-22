
# presentation_ethberlin

Hey we are hypercertain.eth.
HYPERCERTAIN provides tooling for quantifying the impact of funding for public goods by leveraging Blockchain transparency and enforced social interactions between Donors, Impact Creators, Funding Program Managers and Evaluators.
# manifesto
https://ethberlin.ooo/manifesto/

# project goal & scope



## stakeholders
### Funding Program Manager(FPM)
The fundmanager orchestrates how the funds are directed (also off-chain)
### Impact Creator
Provides real world social impact.
### Evaluator
Tries to measure the real world impact of Impact Creators. He either does so alone if there is only one Evaluator or with others in a multisig.
### Donor
Donates money in a way where he can track the impact created with his funds.

# implementation
## Phase 1: Initialization
![1](https://user-images.githubusercontent.com/45817753/190891486-02eeabde-6aaf-4cf7-8044-9e4ec911cfda.png)

In the first phase the FPM is setting up the fund contract where he defines the evaluator(s), the funding goal, an defined starting time where he actually starts orchestrating the funds. Also a scope provided via an not yet evaluated hypercert. 
This is how such an "empty" hypercertificate could look like:

![image](https://user-images.githubusercontent.com/45817753/190891955-b32f70d0-4f23-4287-b9e7-ca450ffa230b.png)

The scope consists of an impact matrix with multiple dimensions. In the following example it contains the values "vaccines given", "vaccines provided" and "vaccine hesitancy" with all quantifiable data set to 0 and all boolean values to false. In a following step this data will be updated by the evaluators.
## Phase 2: Distribution


In the second phase a donor which is satisfied with scope, evaluators, time and funding goal can buy a share of the certificate by donating money.


![2](https://user-images.githubusercontent.com/45817753/190891615-f5e5283d-1371-4533-838d-63d19fa75009.png)

The third phase is initialized if either the funding goal is reached, the evaluation starting time is reached or the FPM has decided to extract the funding early from the contract. The fund does not accept new donations at this point anymore. 

## Phase 3: Evaluation
![3](https://user-images.githubusercontent.com/45817753/190891691-2f632001-d6cc-4c10-85b6-e1108142c223.png)

In the third phase it is the job of the evaluators to update the cert with validated data about the impact scope per funded project.

# Example


![4](https://user-images.githubusercontent.com/45817753/190893648-2cc65608-8137-4133-b4e5-62504258dd13.png)

![image](https://user-images.githubusercontent.com/45817753/190893652-e15b324f-194d-4a8e-a5eb-7bc220e922c7.png)

By measuring how many funds the donor has provided against the other providers he can publicly track how much impact in which field his funds have provided. If he owns 50% of the fund he also owns 50% of the provided impact.

## Timeline
![Timeline](./svg/timeline.svg?raw=false)
