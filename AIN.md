# bert-online on AIN

You can run **bert-online** on [`AIN Cloud Beta`](https://cloud.ainetwork.ai/), which is a product provided by [`AI Network`](https://ainetwork.ai/).

## How to get ready to use AIN Cloud Beta

The payment in [`AIN Cloud Beta`](https://cloud.ainetwork.ai/) is done based on AIN Ethereum Token (Token Symbol: *AIN*), so you need to prepare some account balance before getting started.
Fortunately, AIN Cloud Beta provides welcome bonus for new users and refer to *AIN Cloud Beta Guide (coming soon).* for details.
In summary, 1) sign up on [`cloud.ainetwork.ai/`](https://cloud.ainetwork.ai/) and finish the email verification step to get sign-up bonus (~ 150 AIN) and 2) complete KYC process on [`cloud.ainetwork.ai/buyain`](https://cloud.ainetwork.ai/buyain) to get extra bonus (~ 150 AIN).

## How to play with bert-online on AIN Cloud Beta

Currently bert-online only provides code for SQuAD task. 

### SQuAD

[`SQuAD`](https://rajpurkar.github.io/SQuAD-explorer/) is a reading comprehension dataset consists of reading passages and a set of questions for each reading passage, where the answer to every question is a segment of text from the corresponding reading passage.

### run_squad_online.py

Currently, *model training* using run_squad_online.py is not supported in AIN Cloud Beta as it takes relative long time. What you can do is to try to modify the input part of the source code and see if it gives correct answers:

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

Note that "context" and "qas" correspond to the reading passages and the questions, respectively.
