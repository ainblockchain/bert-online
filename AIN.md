# bert-online on AIN

You can run **bert-online** code on [`AIN Cloud Beta`](https://cloud.ainetwork.ai/), which is a product provided by [`AI Network`](https://ainetwork.ai/).

## How to get ready to use AIN Cloud Beta

The payment in [`AIN Cloud Beta`](https://cloud.ainetwork.ai/) is done based on AIN Ethereum Token (Token Symbol: *AIN*), so you need to prepare some account balance before getting started.
Fortunately, AIN Cloud Beta provides welcome bonus for new users. Please refer to *AIN Cloud Beta Guide (coming soon)* for the details.
In summary, 1) sign up on [`cloud.ainetwork.ai/`](https://cloud.ainetwork.ai/) and finish the email verification step to get sign-up bonus (~ 150 AIN) and 2) complete KYC process on [`cloud.ainetwork.ai/buyain`](https://cloud.ainetwork.ai/buyain) to get extra bonus (~ 150 AIN).

## How to play with bert-online on AIN Cloud Beta

Currently bert-online only provides code for SQuAD task. 

### SQuAD

[`SQuAD`](https://rajpurkar.github.io/SQuAD-explorer/) is a reading comprehension dataset consists of reading passages and a set of questions for each reading passage, where the answer to every question is a segment of text from the corresponding reading passage.

### run_squad_online.py

Currently, *model training* using run_squad_online.py is not supported in AIN Cloud Beta as it takes relative long time.
Try to run the code by pressing the "Run" button [`AIN Cloud Beta`](https://cloud.ainetwork.ai/)
and see if it gives correct answers.
In particular, try to run the code with your own input by modifying the input part of the source code:

```bash
  example = {
    "qas": [
      {
        "question": "The atomic number of the periodic table for oxygen?",
        "id": "571a484210f8ca1400304fbd"
      },
      {
        "question": "What is the second most abundant element?",
        "id": "571a484210f8ca1400304fbe"
      },
      {
        "question": "How many atoms combine to form dioxygen?",
        "id": "571a484210f8ca1400304fc0"
      },
      {
        "question": "Roughly, how much oxygen makes up the Earth crust?",
        "id": "571a484210f8ca1400304fc1"
      },
      {
        "question": "Which gas makes up 20.8% of the Earth's atmosphere?",
        "id": "571a484210f8ca1400304fbf"
      }
    ],
    "context": "Oxygen is a chemical element with symbol O and atomic number 8. It is a member of the chalcogen group on the periodic table and is a highly reactive nonmetal and oxidizing agent that readily forms compounds (notably oxides) with most elements. By mass, oxygen is the third-most abundant element in the universe, after hydrogen and helium. At standard temperature and pressure, two atoms of the element bind to form dioxygen, a colorless and odorless diatomic gas with the formula O\n2. Diatomic oxygen gas constitutes 20.8% of the Earth's atmosphere. However, monitoring of atmospheric oxygen levels show a global downward trend, because of fossil-fuel burning. Oxygen is the most abundant element by mass in the Earth's crust as part of oxide compounds such as silicon dioxide, making up almost half of the crust's mass."
  }
```

Note that "context" and "qas" in the input correspond to the reading passages and the questions, respectively.

The output includes prediction results and n-best predictions results:

```bash
{
    "571a484210f8ca1400304fbd / The atomic number of the periodic table for oxygen?": "8", 
    "571a484210f8ca1400304fbe / What is the second most abundant element?": "hydrogen and helium", 
    "571a484210f8ca1400304fc0 / How many atoms combine to form dioxygen?": "two atoms", 
    "571a484210f8ca1400304fc1 / Roughly, how much oxygen makes up the Earth crust?": "almost half", 
    "571a484210f8ca1400304fbf / Which gas makes up 20.8% of the Earth's atmosphere?": "Diatomic oxygen gas"
}

{
    "571a484210f8ca1400304fbd / The atomic number of the periodic table for oxygen?": [
        {
            "text": "8", 
            "probability": 0.9950033489706708, 
            "start_logit": 6.187430381774902, 
            "end_logit": 7.058764457702637
        }, 
        {
            "text": "atomic number 8", 
            "probability": 0.0033263751209656753, 
            "start_logit": 0.4865674376487732, 
            "end_logit": 7.058764457702637
        }, 
        {
            "text": "8.", 
            "probability": 0.001670275908363632, 
            "start_logit": 6.187430381774902, 
            "end_logit": 0.6690071821212769
        }
    ], 
    "571a484210f8ca1400304fbe / What is the second most abundant element?": [
        {
            "text": "hydrogen and helium", 
            "probability": 0.5357586629405354, 
            "start_logit": 4.084998607635498, 
            "end_logit": 5.108847618103027
        }, 
        {
            "text": "oxygen is the third-most abundant element in the universe, after hydrogen and helium", 
            "probability": 0.31384171238266906, 
            "start_logit": 3.550203561782837, 
            "end_logit": 5.108847618103027
        }, 
        {
            "text": "oxygen", 
            "probability": 0.15039962467679546, 
            "start_logit": 3.550203561782837, 
            "end_logit": 4.373254776000977
        }
    ], 
  ...
}
```
