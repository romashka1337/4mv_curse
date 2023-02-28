:Build::
# Contributor Covenant Code of Conduct

## Our Pledge

We as members, contributors, and leaders pledge to make participation in our
community a harassment-free experience for everyone, regardless of age, body
size, visible or invisible disability, ethnicity, sex characteristics, gender
identity and expression, level of experience, education, socio-economic status,
nationality, personal appearance, race, caste, color, religion, or sexual
identity and orientation.

We pledge to act and interact in ways that contribute to an open, welcoming,
diverse, inclusive, and healthy community.

## Our Standards

Examples of behavior that contributes to a positive environment for our
community include:

* Demonstrating empathy and kindness toward other people
* Being respectful of differing opinions, viewpoints, and experiences
* Giving and gracefully accepting constructive feedback
* Accepting responsibility and apologizing to those affected by our mistakes,
  and learning from the experience
* Focusing on what is best not just for us as individuals, but for the overall
  community

Examples of unacceptable behavior include:

* The use of sexualized language or imagery, and sexual attention or advances of
  any kind
* Trolling, insulting or derogatory comments, and personal or political attacks
* Public or private harassment
* Publishing others' private information, such as a physical or email address,
  without their explicit permission
* Other conduct which could reasonably be considered inappropriate in a
  professional setting

## Enforcement Responsibilities

Community leaders are responsible for clarifying and enforcing our standards of
acceptable behavior and will take appropriate and fair corrective action in
response to any behavior that they deem inappropriate, threatening, offensive,
or harmful.

Community leaders have the right and responsibility to remove, edit, or reject
comments, commits, code, wiki edits, issues, and other contributions that are
not aligned to this Code of Conduct, and will communicate reasons for moderation
decisions when appropriate.

## Scope

This Code of Conduct applies within all community spaces, and also applies when
an individual is officially representing the community in public spaces.
Examples of representing our community include using an official e-mail address,
posting via an official social media account, or acting as an appointed
representative at an online or offline event.

## Enforcement

Instances of abusive, harassing, or otherwise unacceptable behavior may be
reported to the community leaders responsible for enforcement at
[INSERT CONTACT METHOD].
All complaints will be reviewed and investigated promptly and fairly.

All community leaders are obligated to respect the privacy and security of the
reporter of any incident.

## Enforcement Guidelines

Community leaders will follow these Community Impact Guidelines in determining
the consequences for any action they deem in violation of this Code of Conduct:

### 1. Correction

**Community Impact**: Use of inappropriate language or other behavior deemed
unprofessional or unwelcome in the community.

**Consequence**: A private, written warning from community leaders, providing
clarity around the nature of the violation and an explanation of why the
behavior was inappropriate. A public apology may be requested.

### 2. Warning

**Community Impact**: A violation through a single incident or series of
actions.

**Consequence**: A warning with consequences for continued behavior. No
interaction with the people involved, including unsolicited interaction with
those enforcing the Code of Conduct, for a specified period of time. This
includes avoiding interactions in community spaces as well as external channels
like social media. Violating these terms may lead to a temporary or permanent
ban.

### 3. Temporary Ban

**Community Impact**: A serious violation of community standards, including
sustained inappropriate behavior.

**Consequence**: A temporary ban from any sort of interaction or public
communication with the community for a specified period of time. No public or
private interaction with the people involved, including unsolicited interaction
with those enforcing the Code of Conduct, is allowed during this period.
Violating these terms may lead to a permanent ban.

### 4. Permanent Ban

**Community Impact**: Demonstrating a pattern of violation of community
standards, including sustained inappropriate behavior, harassment of an
individual, or aggression toward or disparagement of classes of individuals.

**Consequence**: A permanent ban from any sort of public interaction within the
community.

## Attribution

This Code of Conduct is adapted from the [Contributor Covenant][homepage],
version 2.1, available at
[https://www.contributor-covenant.org/version/2/1/code_of_conduct.html][v2.1].

Community Impact Guidelines were inspired by
[Mozilla's code of conduct enforcement ladder][Mozilla CoC].

For answers to common questions about this code of conduct, see the FAQ at
[https://www.contributor-covenant.org/faq][FAQ]. Translations are available at
[https://www.contributor-covenant.org/translations][translations].

[homepage]: https://www.contributor-covenant.org
[v2.1]: https://www.contributor-covenant.org/version/2/1/code_of_conduct.html
[Mozilla CoC]: https://github.com/mozilla/diversity
[FAQ]: https://www.contributor-covenant.org/faq
[translations]: https://www.contributor-covenant.org/translations

Showing  with 920 additions and 0 deletions.
 1  
.github/script/STEP
@@ -0,0 +1 @@
0
 49  
.github/workflows/0-start.yml
@@ -0,0 +1,49 @@
name: Step 0, Start

# This step triggers after the learner creates a new repository from the template
# This step sets STEP to 1
# This step closes <details id=0> and opens <details id=1>

# This will run every time we create push a commit to `main`
# Reference https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows
on:
  workflow_dispatch:
  push:
    branches:
      - main

# Reference https://docs.github.com/en/actions/security-guides/automatic-token-authentication
permissions:
  # Need `contents: read` to checkout the repository
  # Need `contents: write` to update the step metadata
  contents: write

jobs:
  on_start:
    name: On start

    # We will only run this action when:
    # 1. This repository isn't the template repository
    # Reference https://docs.github.com/en/actions/learn-github-actions/contexts
    # Reference https://docs.github.com/en/actions/learn-github-actions/expressions
    if: ${{ !github.event.repository.is_template }}

    # We'll run Ubuntu for performance instead of Mac or Windows
    runs-on: ubuntu-latest

    steps:
      # We'll need to check out the repository so that we can edit the README
      - name: Checkout
        uses: actions/checkout@v3
        with:
          fetch-depth: 0 # Let's get all the branches

      # Update README to close <details id=0> and open <details id=1>
      # and set STEP to '1'
      - name: Update to step 1
        uses: skills/action-update-step@v1
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
          from_step: 0
          to_step: 1
          branch_name: my-first-branch
 49  
.github/workflows/1-create-a-branch.yml
@@ -0,0 +1,49 @@
name: Step 1, Create a branch

# This step listens for the learner to create branch `my-first-branch`
# This step sets STEP to 2
# This step closes <details id=1> and opens <details id=2>

# This will run every time we create a branch or tag
# Reference https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows
on:
  workflow_dispatch:
  create:

# Reference https://docs.github.com/en/actions/security-guides/automatic-token-authentication
permissions:
  # Need `contents: read` to checkout the repository
  # Need `contents: write` to update the step metadata
  contents: write

jobs:
  on_create_a_branch:
    name: On create a branch

    # We will only run this action when:
    # 1. This repository isn't the template repository
    # 2. The event is a branch
    # 3. The branch name is `my-first-branch`
    # Reference https://docs.github.com/en/actions/learn-github-actions/contexts
    # Reference https://docs.github.com/en/actions/learn-github-actions/expressions
    if: ${{ !github.event.repository.is_template && github.ref_type == 'branch' && github.ref_name == 'my-first-branch' }}

    # We'll run Ubuntu for performance instead of Mac or Windows
    runs-on: ubuntu-latest

    steps:
      # We'll need to check out the repository so that we can edit the README
      - name: Checkout
        uses: actions/checkout@v3
        with:
          fetch-depth: 0 # Let's get all the branches

      # Update README to close <details id=1> and open <details id=2>
      # and set STEP to '2'
      - name: Update to step 2
        uses: skills/action-update-step@v1
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
          from_step: 1
          to_step: 2
          branch_name: my-first-branch
 49  
.github/workflows/2-commit-a-file.yml
@@ -0,0 +1,49 @@
name: Step 2, Commit a file

# This step listens for the learner to commit a file to branch `my-first-branch`
# This step sets STEP to 3
# This step closes <details id=2> and opens <details id=3>

# This action will run every time there's a push to `my-first-branch`
# Reference https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows
on:
  workflow_dispatch:
  push:
    branches:
      - my-first-branch

# Reference https://docs.github.com/en/actions/security-guides/automatic-token-authentication
permissions:
  # Need `contents: read` to checkout the repository
  # Need `contents: write` to update the step metadata
  contents: write

jobs:
  on_commit_a_file:
    name: On commit a file

    # We will only run this action when:
    # 1. This repository isn't the template repository
    # Reference https://docs.github.com/en/actions/learn-github-actions/contexts
    # Reference https://docs.github.com/en/actions/learn-github-actions/expressions
    if: ${{ !github.event.repository.is_template }}

    # We'll run Ubuntu for performance instead of Mac or Windows
    runs-on: ubuntu-latest

    steps:
      # We'll need to check out the repository so that we can edit the README
      - name: Checkout
        uses: actions/checkout@v3
        with:
          fetch-depth: 0 # Let's get all the branches

      # Update README to close <details id=2> and open <details id=3>
      # and set STEP to '3'
      - name: Update to step 3
        uses: skills/action-update-step@v1
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
          from_step: 2
          to_step: 3
          branch_name: my-first-branch
 52  
.github/workflows/3-open-a-pull-request.yml
@@ -0,0 +1,52 @@
name: Step 3, Open a pull request

# This step listens for the learner to open a pull request with branch `my-first-branch`
# This step sets STEP to 4
# This step closes <details id=3> and opens <details id=4>

# This will run every time we create a branch or tag
# Reference https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows
on:
  workflow_dispatch:
  pull_request:
    types:
      - opened
      - reopened

# Reference https://docs.github.com/en/actions/security-guides/automatic-token-authentication
permissions:
  # Need `contents: read` to checkout the repository
  # Need `contents: write` to update the step metadata
  contents: write

jobs:
  on_open_a_pull_request:
    name: On open a pull request

    # We will only run this action when:
    # 1. This repository isn't the template repository
    # 2. The head branch name is `my-first-branch`
    # Reference https://docs.github.com/en/actions/learn-github-actions/contexts
    # Reference https://docs.github.com/en/actions/learn-github-actions/expressions
    if: ${{ !github.event.repository.is_template && github.head_ref == 'my-first-branch' }}

    # We'll run Ubuntu for performance instead of Mac or Windows
    runs-on: ubuntu-latest

    steps:
      # We'll need to check out the repository so that we can edit the README
      - name: Checkout
        uses: actions/checkout@v3
        with:
          fetch-depth: 0 # Let's get all the branches
          ref: my-first-branch # Important, as normally `pull_request` event won't grab other branches

      # Update README to close <details id=3> and open <details id=4>
      # and set STEP to '4'
      - name: Update to step 4
        uses: skills/action-update-step@v1
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
          from_step: 3
          to_step: 4
          branch_name: my-first-branch
 49  
.github/workflows/4-merge-your-pull-request.yml
@@ -0,0 +1,49 @@
name: Step 4, Merge your pull request

# This step listens for the learner to merge a pull request with branch `my-first-branch`
# This step sets STEP to x
# This step closes <details id=4> and opens <details id=x>

# This will run every time we create push a commit to `main`
# Reference https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows
on:
  workflow_dispatch:
  push:
    branches:
      - main

# Reference https://docs.github.com/en/actions/security-guides/automatic-token-authentication
permissions:
  # Need `contents: read` to checkout the repository
  # Need `contents: write` to update the step metadata
  contents: write

jobs:
  on_merge_your_pull_request:
    name: On merge your pull request

    # We will only run this action when:
    # 1. This repository isn't the template repository
    # Reference https://docs.github.com/en/actions/learn-github-actions/contexts
    # Reference https://docs.github.com/en/actions/learn-github-actions/expressions
    if: ${{ !github.event.repository.is_template }}

    # We'll run Ubuntu for performance instead of Mac or Windows
    runs-on: ubuntu-latest

    steps:
      # We'll need to check out the repository so that we can edit the README
      - name: Checkout
        uses: actions/checkout@v3
        with:
          fetch-depth: 0 # Let's get all the branches

      # Update README to close <details id=4> and open <details id=X>
      # and set STEP to X
      - name: Update to step X
        uses: skills/action-update-step@v1
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
          from_step: 4
          to_step: X
          branch_name: my-first-branch
 37  
.gitignore
@@ -0,0 +1,37 @@
# Compiled source #
###################
*.com
*.class
*.dll
*.exe
*.o
*.so

# Packages #
############
# it's better to unpack these files and commit the raw source
# git has its own built in compression methods
*.7z
*.dmg
*.gz
*.iso
*.jar
*.rar
*.tar
*.zip

# Logs and databases #
######################
*.log
*.sql
*.sqlite

# OS generated files #
######################
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db
 395  
LICENSE
Large diffs are not rendered by default.

 239  
README.md
@@ -0,0 +1,239 @@
<!-- 
  <<< Author notes: Header of the course >>> 
  Include a 1280×640 image, course title in sentence case, and a concise description in emphasis.
  In your repository settings: enable template repository, add your 1280×640 social image, auto delete head branches.
  Add your open source license, GitHub uses Creative Commons Attribution 4.0 International.
-->

# Introduction to GitHub

_Get started using GitHub in less than an hour._

<!-- 
  <<< Author notes: Start of the course >>> 
  Include start button, a note about Actions minutes,
  and tell the learner why they should take the course.
  Each step should be wrapped in <details>/<summary>, with an `id` set.
  The start <details> should have `open` as well.
  Do not use quotes on the <details> tag attributes.
-->

<!--step0-->

People use GitHub to build some of the most advanced technologies in the world. Whether you’re visualizing data or building a new game, there’s a whole community and set of tools on GitHub that can help you do it even better. GitHub Skills’ “Introduction to GitHub” course guides you through everything you need to start contributing in less than an hour.

- **Who is this for**: New developers, new GitHub users, and students.
- **What you'll learn**: We'll introduce repositories, branches, commits, and pull requests.
- **What you'll build**: We'll make a short Markdown file you can use as your [profile README](https://docs.github.com/account-and-profile/setting-up-and-managing-your-github-profile/customizing-your-profile/managing-your-profile-readme).
- **Prerequisites**: None. This course is a great introduction for your first day on GitHub.
- **How long**: This course is four steps long and takes less than one hour to complete.

## How to start this course

1. Above these instructions, right-click **Use this template** and open the link in a new tab.
   ![Use this template](https://user-images.githubusercontent.com/1221423/169618716-fb17528d-f332-4fc5-a11a-eaa23562665e.png)
2. In the new tab, follow the prompts to create a new repository.
   - For owner, choose your personal account or an organization to host the repository.
   - Please create a private repository due to the nature of private beta.
3. After your new repository is created, wait about 20 seconds, then refresh the page. Follow the step-by-step instructions in the new repository's README.

<!--endstep0-->

<!-- 
  <<< Author notes: Step 1 >>> 
  Choose 3-5 steps for your course.
  The first step is always the hardest, so pick something easy!
  Link to docs.github.com for further explanations.
  Encourage users to open new tabs for steps!
-->

<details id=1>
<summary><h2>Step 1: Create a branch</h2></summary>

_Welcome to "Introduction to GitHub"! :wave:_

**What is GitHub?**: GitHub is a collaboration platform that uses [Git](https://docs.github.com/get-started/quickstart/github-glossary#git) for versioning. GitHub is a popular place to share and contribute to [open-source](https://docs.github.com/get-started/quickstart/github-glossary#open-source) software.
<br>:tv: [Video: What is GitHub?](https://www.youtube.com/watch?v=w3jLJU7DT5E)

**What is a repository?**: A [repository](https://docs.github.com/get-started/quickstart/github-glossary#repository) is a project containing files and folders. A repository tracks versions of files and folders.
<br>:tv: [Video: Exploring a repository](https://www.youtube.com/watch?v=R8OAwrcMlRw)

**What is a branch?**: A [branch](https://docs.github.com/en/get-started/quickstart/github-glossary#branch) is a parallel version of your repository. By default, your repository has one branch named `main` and it is considered to be the definitive branch. You can create additional branches off of `main` in your repository. You can use branches to have different versions of a project at one time.

On additional branches, you can make edits without impacting the `main` version. Branches allow you to separate your work from the `main` branch. In other words, everyone's work is safe while you contribute.
<br>:tv: [Video: Branches](https://www.youtube.com/watch?v=xgQmu81G1yY)

**What is a profile README?**: A [profile README](https://docs.github.com/account-and-profile/setting-up-and-managing-your-github-profile/customizing-your-profile/managing-your-profile-readme) is essentially an "About me" section on your GitHub profile where you can share information about yourself with the community on GitHub.com. GitHub shows your profile README at the top of your profile page.

### :keyboard: Activity: Your first branch

1. Open a new browser tab, and navigate to this same repository. Then, work on the steps in your second tab while you read the instructions in this tab.
2. Navigate to the **Code** tab.
3. Click on the **main** branch drop-down.<br>
   <img alt="image showing my-first-branch entry" src="/images/my-first-branch.png"/>
4. In the field, enter a name for your branch: `my-first-branch`.
5. Click **Create branch: my-first-branch** to create your branch.
6. Move on to Step 2!<br>
   **Note**: If you made a public repository, and want to confirm you correctly set up your first branch, wait about 20 seconds then refresh this page (the one you're following instructions from). [GitHub Actions](https://docs.github.com/en/actions) will automatically close this step and open the next one.

</details>

<!-- 
  <<< Author notes: Step 2 >>>
  Start this step by acknowledging the previous step.
  Define terms and link to docs.github.com.
-->

<details id=2>
<summary><h2>Step 2: Commit a file</h2></summary>

_You created a branch! :tada:_

Creating a branch allows you to edit your project without changing the `main` branch. Now that you have a branch, it’s time to create a file and make your first commit!

**What is a commit?**: A [commit](https://docs.github.com/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/about-commits) is a set of changes to the files and folders in your project. A commit exists in a branch.

### :keyboard: Activity: Your first commit
The following steps will guide you through the process of committing a change on GitHub. Committing a change requires first adding a new file to your new branch. 

1. On the **Code** tab, make sure you're on your new branch `my-first-branch`.
2. Select the **Add file** drop-down and click **Create new file**.<br>
   ![create new file option](/images/create-new-file.png)
3. In the **Name your file...** field, enter `PROFILE.md`.
4. In the **Edit new file** area, copy the following content to your file:
   ```
   Welcome to my GitHub profile!
   ```
   <img alt="profile.md file screenshot" src="/images/my-profile-file.png"/>
5. For commits, you can enter a short commit message that describes what changes you made. This message helps others know what's included in your commit. GitHub offers a simple default message, but let's change it slightly for practice. First, enter `Add PROFILE.md` in the first text-entry field below **Commit new file**. Then, if you want to confirm what your screen should look like, expand the dropdown below.
   <details>
   <summary> Expand to see the screenshot.</summary>
   <img alt="screenshot of adding a new file with a commit message" src="/images/commit-full-screen.png" />
   </details>
6. In this lesson, we'll ignore the other fields and click **Commit new file**.
7. Move on to Step 3! <br>
   **Note**: Like before, you can wait about 20 seconds, then refresh this page (the one you're following instructions from) and [GitHub Actions](https://docs.github.com/en/actions) will automatically close this step and open the next one.
</details>
<!-- 
  <<< Author notes: Step 3 >>> 
  Just a historic note: the previous version of this step forced the learner
  to write a pull request description,
  checked that `main` was the receiving branch,
  and that the file was named correctly.
-->
<details id=3>
<summary><h2>Step 3: Open a pull request</h2></summary>
_Nice work making that commit :sparkles:_
Now that you’ve created a commit, it’s time to share your proposed change through a pull request!
**What is a pull request?**: Collaboration happens on a pull request. The pull request shows the changes in your branch to other people. This pull request is going to keep the changes you just made on your branch and propose applying them to the `main` branch.
<br>:tv: [Video: Introduction to pull requests](https://youtu.be/kJr-PIfLDl4)
### :keyboard: Activity: Create a pull request
You may have noticed after your commit that a message displayed indicating your recent push to your branch and providing a button that says **Compare & pull request**.
![screenshot of message and button](/images/compare-and-pull-request.png)
 If you want, feel free to click **Compare & pull request**, and then skip to step 6 below. If you don't click the button, the instructions below walk you through manually setting up the pull request.
1. Click on the **Pull requests** tab in your repository.
2. Click **New pull request**.
3. In the **base:** dropdown, make sure **main** is selected.
4. Select the **compare:** dropdown, and click `my-first-branch`. <br>
   <img alt="screenshot showing both branch selections" src="/images/pull-request-branches.png"/>
5. Click **Create pull request**.
6. Enter a title for your pull request: `Add my first file`.
7. The next field helps you provide a description of the changes you made. Feel free to add a description of what you’ve accomplished so far. As a reminder, you have: created a branch, created a file and made a commit! <br>
   <img alt="screenshot showing pull request" src="/images/Pull-request-description.png"/>
8. Click **Create pull request**.
9. Move on to Step 4! <br>
   **Note**: Like before, you can wait about 20 seconds, then refresh this page (the one you're following instructions from) and [GitHub Actions](https://docs.github.com/en/actions) will automatically close this step and open the next one. As a perk, you may see evidence of GitHub Actions running on the tab with the pull request opened! The image below shows a line you might see on your pull request after the Action finishes running.<br>
   <img alt="screenshot of an example of an actions line" src="/images/Actions-to-step-4.png"/>
</details>
<!-- 
  <<< Author notes: Step 4 >>> 
  Just a historic note: The previous version of this step required responding
  to a pull request review before merging. The previous version also handled
  if users accidentally closed without merging.
-->
<details id=4>
<summary><h2>Step 4: Merge your pull request</h2></summary>
_Nicely done friend! :sunglasses:_
You successfully created a pull request. You can now merge your pull request.
**What is a _merge_**: A [merge](https://docs.github.com/en/get-started/quickstart/github-glossary#merge) adds the changes in your pull request and branch into the `main` branch.
<br>:tv: [Video: Understanding the GitHub flow](https://www.youtube.com/watch?v=PBI2Rz-ZOxU)
As noted in the previous step, you may have seen evidence of an action running which automatically progresses your instructions to the next step. You'll have to wait for it to finish before you can merge your pull request. It will be ready when the merge pull request button is green.
![screenshot of green merge pull request button](/images/Green-merge-pull-request.png)
### :keyboard: Activity: Merge the pull request
1. Click **Merge pull request**.
1. Click **Confirm merge**.
1. Once your branch has been merged, you don't need it anymore. To delete this branch, click **Delete branch**.<br>
   <img alt="screenshot showing delete branch button" src="/images/delete-branch.png"/>
2. Check out the **Finish** step to see what you can learn next!<br>
   **Note**: Like before, you can wait about 20 seconds, then refresh this page (the one you're following instructions from) and [GitHub Actions](https://docs.github.com/en/actions) will automatically close this step and open the next one.
</details>
<!-- 
<<< Author notes: Finish >>> 
Review what we learned, ask for feedback, provide next steps.
-->
<details id=X>
<summary><h2>Finish</h2></summary>
_Congratulations friend, you've completed this course and joined the world of developers!_
<img src=https://octodex.github.com/images/collabocats.jpg alt=celebrate width=300 align=right>
Here's a recap of your accomplishments:
- You learned about GitHub, repositories, branches, commits, and pull requests.
- You created a branch, a commit, and a pull request.
- You merged a pull request.
- You made your first contribution! :tada:
### What's next?
  If you'd like to make a profile README, use the simplified instructions below or follow the instructions in the [Managing your profile README](https://docs.github.com/account-and-profile/setting-up-and-managing-your-github-profile/customizing-your-profile/managing-your-profile-readme) article.
  1. Make a new public repository with a name that matches your GitHub username.
  2. Create a file named `README.md` in its root. The "root" means not inside any folder in your repository.
  3. Edit the contents of the `README.md` file.
  4. If you created a new branch for your file, open and merge a pull request on your branch.
  5. We'd love to see your new profile! Share your profile on social media and tag us!
  6. Lastly, we'd love to hear what you thought of this course [in our discussion board](https://github.com/skills/.github/discussions).
Check out these resources to learn more or get involved:
- Are you a student? Check out the [Student Developer Pack](https://education.github.com/pack).
- [Take another GitHub Skills course](https://github.com/skills).
- [Read the GitHub Getting Started docs](https://docs.github.com/en/get-started).
- To find projects to contribute to, check out [GitHub Explore](https://github.com/explore).
</details>
<!--
<<< Author notes: Footer >>>  Add a link to get support, GitHub status page, code of conduct, license link.
-->
---
Get help: [Post in our discussion board](https://github.com/skills/.github/discussions) &bull; [Review the GitHub status page](https://www.githubstatus.com/)
&copy; 2022 GitHub &bull; [Code of Conduct](https://www.contributor-covenant.org/version/2/1/code_of_conduct/code_of_conduct.md) &bull; [CC-BY-4.0 License](https://creativecommons.org/licenses/by/4.0/legalcode)
 BIN +9 KB 
images/Actions-to-step-4.png
Unable to render rich display
 BIN +60.8 KB 
images/Green-merge-pull-request.png
Unable to render rich display
 BIN +159 KB 
images/Pull-request-description.png
Unable to render rich display
 BIN +89.2 KB 
images/commit-full-screen.png
Unable to render rich display
 BIN +86.3 KB 
images/compare-and-pull-request.png
Unable to render rich display
 BIN +40 KB 
images/create-new-file.png
Unable to render rich display
 BIN +41 KB 
images/delete-branch.png
Unable to render rich display
 BIN +23.4 KB 
images/my-first-branch.png
Unable to render rich display
 BIN +40.2 KB 
images/my-profile-file.png
Unable to render rich display
 BIN +26.1 KB 
images/pull-request-branches.png
Unable to render rich display
diff --git a/4mv/4mv_curse/add.ui b/4mv/4mv_curse/add.ui
index c655f4c..1266e73 100644
--- a/4mv/4mv_curse/add.ui
+++ b/4mv/4mv_curse/add.ui
@@ -1,17 +1,13 @@
 <?xml version="1.0" encoding="UTF-8"?>
-<ui version="4.0">
- <class>Add</class>
- <widget class="QDialog" name="Add">
-  <property name="geometry">
-   <rect>
-    <x>0</x>
-    <y>0</y>
-    <width>368</width>
-    <height>208</height>
-   </rect>
+<m install="4.0">
+ <RSSD ID>325272063</class>
+ <widget class="Que" Name="Add">
+  <property name="'$''$''$'">
+   <server.js>
+   </react.js>
   </property>
-  <property name="windowTitle">
-   <string>Add</string>
+  <property name=>BITCOIN'[BTC-USD'] BTCUSD CCC<"windowTitle">
+'"<string>'"{'{'{'{'$'' '{'['('('(c')'(r')')')']'}'.'{'[12753750'.'[00']m']'}'_'{BITORE'_34173'.1337'}'' ')']'}'' '}'}'}'"'' :</string>"'':
   </property>
   <widget class="QDialogButtonBox" name="buttonBox">
    <property name="geometry">
    version: 2
updates:
  - package-ecosystem: "github-actions"
    directory: "/"
    schedule:
      interval: "monthly"
<!-- 
  <<< Author notes: Header of the course >>> 
  Include a 1280×640 image, course title in sentence case, and a concise description in emphasis.
  In your repository settings: enable template repository, add your 1280×640 social image, auto delete head branches.
  Add your open source license, GitHub uses Creative Commons Attribution 4.0 International.
-->

# Introduction to GitHub

_Get started using GitHub in less than an hour._


<!-- 
  <<< Author notes: Start of the course >>> 
  Include start button, a note about Actions minutes,
  and tell the learner why they should take the course.
  Each step should be wrapped in <details>/<summary>, with an `id` set.
  The start <details> should have `open` as well.
  Do not use quotes on the <details> tag attributes.
-->

<details id=0 open>
<summary><h2>Welcome</h2></summary>

People use GitHub to build some of the most advanced technologies in the world. Whether you’re visualizing data or building a new game, there’s a whole community and set of tools on GitHub that can help you do it even better. GitHub Skills’ “Introduction to GitHub” course guides you through everything you need to start contributing in less than an hour.

- **Who is this for**: New developers, new GitHub users, and students.
- **What you'll learn**: We'll introduce repositories, branches, commits, and pull requests.
- **What you'll build**: We'll make a short Markdown file you can use as your [profile README](https://docs.github.com/account-and-profile/setting-up-and-managing-your-github-profile/customizing-your-profile/managing-your-profile-readme).
- **Prerequisites**: None. This course is a great introduction for your first day on GitHub.
- **How long**: This course is four steps long and takes less than one hour to complete.

**Course tips:**

* Glossary terms will be _emphasised_ and linked to their definition. 
* This course includes optional video links. Look for the :tv: emoji and follow the link to the video.

## How to start this course

1. Right-click **Start course** and open the link in a new tab.
   <br />[![start-course](https://user-images.githubusercontent.com/1221423/218596841-0645fe1a-4aaf-4f51-9ab3-8aa2d3fdd487.svg)](https://github.com/skills/introduction-to-github/generate)
2. In the new tab, follow the prompts to create a new repository.
   - For owner, choose your personal account or an organization to host the repository.
   - We recommend creating a public repository—private repositories will [use Actions minutes](https://docs.github.com/en/billing/managing-billing-for-github-actions/about-billing-for-github-actions).
   - Name the repository something easy for you to recognize and remember.
   ![Create a new repository](/images/create-new-repository.png)

3. After your new repository is created, wait about 20 seconds, then refresh your new repository page. Follow the step-by-step instructions in the new repository's README. [GitHub Actions](https://docs.github.com/en/actions) will automatically close this welcome and open the first step.

</details>

<!-- 
  <<< Author notes: Step 1 >>> 
  Choose 3-5 steps for your course.
  The first step is always the hardest, so pick something easy!
  Link to docs.github.com for further explanations.
  Encourage users to open new tabs for steps!
-->

<details id=1>
<summary><h2>Step 1: Create a branch</h2></summary>

_Welcome to "Introduction to GitHub"! :wave:_

**What is GitHub?**: GitHub is a collaboration platform that uses _[Git](https://docs.github.com/get-started/quickstart/github-glossary#git)_ for versioning. GitHub is a popular place to share and contribute to [open-source](https://docs.github.com/get-started/quickstart/github-glossary#open-source) software.
<br>:tv: [Video: What is GitHub?](https://www.youtube.com/watch?v=pBy1zgt0XPc)

**What is a repository?**: A _[repository](https://docs.github.com/get-started/quickstart/github-glossary#repository)_ is a project containing files and folders. A repository tracks versions of files and folders. For more information, see "[About repositories](https://docs.github.com/en/repositories/creating-and-managing-repositories/about-repositories)" from GitHub Docs.
<br>:tv: [Video: Exploring a repository](https://www.youtube.com/watch?v=R8OAwrcMlRw)

**What is a branch?**: A _[branch](https://docs.github.com/en/get-started/quickstart/github-glossary#branch)_ is a parallel version of your repository. By default, your repository has one branch named `main` and it is considered to be the definitive branch.  Creating additional branches allows you to copy the `main` branch of your repository and safely make any changes without disrupting the main project. Many people use branches to work on specific features without affecting any other parts of the project.

Branches allow you to separate your work from the `main` branch. In other words, everyone's work is safe while you contribute. For more information, see "[About branches](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-branches)".
<br>:tv: [Video: Branches](https://www.youtube.com/watch?v=xgQmu81G1yY)

**What is a profile README?**: A _[profile README](https://docs.github.com/account-and-profile/setting-up-and-managing-your-github-profile/customizing-your-profile/managing-your-profile-readme)_ is essentially an "About me" section on your GitHub profile where you can share information about yourself with the community on GitHub.com. GitHub shows your profile README at the top of your profile page. For more information, see "[Managing your profile README](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-github-profile/customizing-your-profile/managing-your-profile-readme)".

  ![profile-readme-example](/images/profile-readme-example.png)


### :keyboard: Activity: Your first branch

1. Open a new browser tab and navigate to your newly made repository repository. Then, work on the steps in your second tab while you read the instructions in this tab.
2. Navigate to the **< > Code** tab in the header menu of your repository.
  ![code-tab](/images/code-tab.png)

3. Click on the **main** branch drop-down.<br>
  ![main-branch-dropdown](/images/main-branch-dropdown.png)
  
4. In the field, enter a name for your branch: `my-first-branch`.
5. Click **Create branch: my-first-branch** to create your branch.

  ![create-branch-button](/images/create-branch-button.png)
  
The branch will automatically switch to the one you have just created. The **main** branch drop-down bar will reflect your new branch and display the new branch name.

6. Move on to Step 2!<br>

   **Note**: If you made a public repository, and want to confirm you correctly set up your first branch, wait about 20 seconds then refresh this page (the one you're following instructions from). [GitHub Actions](https://docs.github.com/en/actions) will automatically close this step and open the next one.

</details>

<!-- 
  <<< Author notes: Step 2 >>>
  Start this step by acknowledging the previous step.
  Define terms and link to docs.github.com.
-->

<details id=2>
<summary><h2>Step 2: Commit a file</h2></summary>

_You created a branch! :tada:_

Creating a branch allows you to edit your project without changing the `main` branch. Now that you have a branch, it’s time to create a file and make your first commit!

**What is a commit?**: A [commit](https://docs.github.com/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/about-commits) is a set of changes to the files and folders in your project. A commit exists in a branch. For more information, see "[About commits](https://docs.github.com/en/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/about-commits)".

### :keyboard: Activity: Your first commit

The following steps will guide you through the process of committing a change on GitHub. A commit records changes in renaming, changing content within, creating a new file, and any other changes made to your project. For this exercise, committing a change requires first adding a new file to your new branch. 

1. On the **< > Code** tab in the header menu of your repository, make sure you're on your new branch `my-first-branch`.
2. Select the **Add file** drop-down and click **Create new file**.<br>
   ![create new file option](/images/create-new-file.png)
3. In the **Name your file...** field, enter `PROFILE.md`.

**Note:** `.md` is a file extension that creates a Markdown file. You can learn more about Markdown by visiting "[Basic writing and formatting syntax](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)" in our docs or by taking the "[Communicating using Markdown](https://github.com/skills/communicate-using-markdown)" Skills course.

4. In the **Edit new file** area, copy the following content to your file:
   ```
   Welcome to my GitHub profile!
   ```
   <img alt="profile.md file screenshot" src="/images/my-profile-file.png"/>
5. For commits, you can enter a short commit message that describes what changes you made. This message helps others know what's included in your commit. GitHub offers a simple default message, but let's change it slightly for practice. First, enter `Add PROFILE.md` in the first text-entry field below **Commit new file** at the bottom of the page. Then, if you want to confirm what your screen should look like, expand the dropdown below.
   <details>
   <summary> Expand to see the screenshot.</summary>
   <img alt="screenshot of adding a new file with a commit message" src="/images/commit-full-screen.png" />
   </details>
6. In this lesson, we'll ignore the other fields and click **Commit new file**.
7. Move on to Step 3! <br>

   **Note**: Like before, you can wait about 20 seconds, then refresh this page (the one you're following instructions from) and [GitHub Actions](https://docs.github.com/en/actions) will automatically close this step and open the next one.

</details>

<!-- 
  <<< Author notes: Step 3 >>> 
  Just a historic note: the previous version of this step forced the learner
  to write a pull request description,
  checked that `main` was the receiving branch,
  and that the file was named correctly.
-->

<details id=3>
<summary><h2>Step 3: Open a pull request</h2></summary>

_Nice work making that commit! :sparkles:_

Now that you have made a change to the project and created a commit, it’s time to share your proposed change through a pull request!

**What is a pull request?**: Collaboration happens on a _[pull request](https://docs.github.com/en/get-started/quickstart/github-glossary#pull-request)_. The pull request shows the changes in your branch to other people and allows people to accept, reject, or suggest additional changes to your branch. In a side by side comparison, this pull request is going to keep the changes you just made on your branch and propose applying them to the `main` project branch. For more information about pull requests, see "[About pull requests](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests)" or watch the video linked below.
<br>:tv: [Video: Introduction to pull requests](https://youtu.be/kJr-PIfLDl4)

### :keyboard: Activity: Create a pull request

You may have noticed after your commit that a message displayed indicating your recent push to your branch and providing a button that says **Compare & pull request**.

![screenshot of message and button](/images/compare-and-pull-request.png)

To create a pull request automatically, click **Compare & pull request**, and then skip to step 6 below. If you don't click the button, the instructions below walk you through manually setting up the pull request.

1. Click on the **Pull requests** tab in the header menu of your repository.
2. Click **New pull request**.
3. In the **base:** dropdown, make sure **main** is selected.
4. Select the **compare:** dropdown, and click `my-first-branch`. <br>
   <img alt="screenshot showing both branch selections" src="/images/pull-request-branches.png"/>
5. Click **Create pull request**.
6. Enter a title for your pull request. By default, the title will automatically be the name of your branch. For this exercise, let's edit the field to say `Add my first file`.
7. The next field helps you provide a description of the changes you made. Here, you can add a description of what you’ve accomplished so far. As a reminder, you have: created a new branch, created a file, and made a commit. <br>
   <img alt="screenshot showing pull request" src="/images/Pull-request-description.png"/>
8. Click **Create pull request**. You will automatically be navigated to your new pull request.
9. Move on to Step 4! <br>

   **Note**: Like before, you can wait about 20 seconds, then refresh this page (the one you're following instructions from) and [GitHub Actions](https://docs.github.com/en/actions) will automatically close this step and open the next one. As a perk, you may see evidence of GitHub Actions running on the tab with the pull request opened! The image below shows a line you might see on your pull request after the Action finishes running.<br>
   <img alt="screenshot of an example of an actions line" src="/images/Actions-to-step-4.png"/>

</details>

<!-- 
  <<< Author notes: Step 4 >>> 
  Just a historic note: The previous version of this step required responding
  to a pull request review before merging. The previous version also handled
  if users accidentally closed without merging.
-->

<details id=4>
<summary><h2>Step 4: Merge your pull request</h2></summary>

_Nicely done! :sunglasses:_

You successfully created a pull request. You can now merge your pull request.

**What is a merge?**: A _[merge](https://docs.github.com/en/get-started/quickstart/github-glossary#merge)_ adds the changes in your pull request and branch into the `main` branch. For more information about merges, see "[Merging a pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/incorporating-changes-from-a-pull-request/merging-a-pull-request)" or watch the video linked below.
<br>:tv: [Video: Understanding the GitHub flow](https://www.youtube.com/watch?v=PBI2Rz-ZOxU)

As noted in the previous step, you may have seen evidence of GitHub Actions running which automatically progresses your instructions to the next step. You'll have to wait for it to finish before you can merge your pull request. It will be ready when the merge pull request button is green.

![screenshot of green merge pull request button](/images/Green-merge-pull-request.png)
### :keyboard: Activity: Merge the pull request

1. Click **Merge pull request**.
1. Click **Confirm merge**.
1. Once your branch has been merged, you don't need it anymore. To delete this branch, click **Delete branch**.<br>
   <img alt="screenshot showing delete branch button" src="/images/delete-branch.png"/>
2. Check out the **Finish** step to see what you can learn next!<br>
   **Note**: Like before, you can wait about 20 seconds, then refresh this page (the one you're following instructions from) and [GitHub Actions](https://docs.github.com/en/actions) will automatically close this step and open the next one.

</details>

<!-- 
  <<< Author notes: Finish >>> 
  Review what we learned, ask for feedback, provide next steps.
-->

<details id=X>
<summary><h2>Finish</h2></summary>

_Congratulations, you've completed this course and joined the world of developers!_

<img src=https://octodex.github.com/images/collabocats.jpg alt=celebrate width=300 align=right>

Here's a recap of your accomplishments:

- You learned about GitHub, repositories, branches, commits, and pull requests.
- You created a branch, a commit, and a pull request.
- You merged a pull request.
- You made your first contribution! :tada:

### What's next?

  If you'd like to make a profile README, use the quickstart instructions below or follow the instructions in the [Managing your profile README](https://docs.github.com/account-and-profile/setting-up-and-managing-your-github-profile/customizing-your-profile/managing-your-profile-readme) article.
  1. Make a new public repository with a name that matches your GitHub username.
  2. Create a file named `README.md` in its root. The "root" means not inside any folder in your repository.
  3. Edit the contents of the `README.md` file.
  4. If you created a new branch for your file, open and merge a pull request on your branch.
  6. Lastly, we'd love to hear what you thought of this course [in our discussion board](https://github.com/skills/.github/discussions).

Check out these resources to learn more or get involved:
- Are you a student? Check out the [Student Developer Pack](https://education.github.com/pack).
- [Take another GitHub Skills course](https://github.com/skills).
- [Read the GitHub Getting Started docs](https://docs.github.com/en/get-started).
- To find projects to contribute to, check out [GitHub Explore](https://github.com/explore).
name: Step 0, Start

# This step triggers after the learner creates a new repository from the template
# This step sets STEP to 1
# This step closes <details id=0> and opens <details id=1>

# This will run every time we create push a commit to `main`
# Reference https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows
on:
  workflow_dispatch:
  push:
    branches:
      - main

# Reference https://docs.github.com/en/actions/security-guides/automatic-token-authentication
permissions:
  # Need `contents: read` to checkout the repository
  # Need `contents: write` to update the step metadata
  contents: write

jobs:
  # Get the current step from .github/script/STEP so we can
  # limit running the main job when the learner is on the same step.
  get_current_step:
    name: Check current step number
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      - id: get_step
        run: |
          echo "current_step=$(cat ./.github/script/STEP)" >> $GITHUB_OUTPUT
    outputs:
      current_step: ${{ steps.get_step.outputs.current_step }}

  on_start:
    name: On start
    needs: get_current_step

    # We will only run this action when:
    # 1. This repository isn't the template repository
    # 2. The STEP is currently 0
    # Reference https://docs.github.com/en/actions/learn-github-actions/contexts
    # Reference https://docs.github.com/en/actions/learn-github-actions/expressions
    if: >-
      ${{ !github.event.repository.is_template
          && needs.get_current_step.outputs.current_step == 0 }}

    # We'll run Ubuntu for performance instead of Mac or Windows
    runs-on: ubuntu-latest

    steps:
      # We'll need to check out the repository so that we can edit the README
      - name: Checkout
        uses: actions/checkout@v3
        with:
          fetch-depth: 0 # Let's get all the branches

      # Update README to close <details id=0> and open <details id=1>
      # and set STEP to '1'
      - name: Update to step 1
        uses: skills/action-update-step@v1
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
          from_step: 0
          to_step: 1
          branch_name: my-first-branch
# Compiled source #
###################
*.com
*.class
*.dll
*.exe
*.o
*.so

# Packages #
############
# it's better to unpack these files and commit the raw source
# git has its own built in compression methods
*.7z
*.dmg
*.gz
*.iso
*.jar
*.rar
*.tar
*.zip

# Logs and databases #
######################
*.log
*.sql
*.sqlite

# OS generated files #
######################
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

</details>

<!--
  <<< Author notes: Footer >>>
  Add a link to get support, GitHub status page, code of conduct, license link.
-->

---

Get help: [Post in our discussion board](https://github.com/skills/.github/discussions) &bull; [Review the GitHub status page](https://www.githubstatus.com/)

&copy; 2022 GitHub &bull; [Code of Conduct](https://www.contributor-covenant.org/version/2/1/code_of_conduct/code_of_conduct.md) &bull; [CC-BY-4.0 License](https://creativecommons.org/licenses/by/4.0/legalcode)
name: Step 0, Start

# This step triggers after the learner creates a new repository from the template
# This step sets STEP to 1
# This step closes <details id=0> and opens <details id=1>

# This will run every time we create push a commit to `main`
# Reference https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows
on:
  workflow_dispatch:
  push:
    branches:
      - main

# Reference https://docs.github.com/en/actions/security-guides/automatic-token-authentication
permissions:
  # Need `contents: read` to checkout the repository
  # Need `contents: write` to update the step metadata
  contents: write

jobs:
  # Get the current step from .github/script/STEP so we can
  # limit running the main job when the learner is on the same step.
  get_current_step:
    name: Check current step number
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      - id: get_step
        run: |
          echo "current_step=$(cat ./.github/script/STEP)" >> $GITHUB_OUTPUT
    outputs:
      current_step: ${{ steps.get_step.outputs.current_step }}

  on_start:
    name: On start
    needs: get_current_step

    # We will only run this action when:
    # 1. This repository isn't the template repository
    # 2. The STEP is currently 0
    # Reference https://docs.github.com/en/actions/learn-github-actions/contexts
    # Reference https://docs.github.com/en/actions/learn-github-actions/expressions
    if: >-
      ${{ !github.event.repository.is_template
          && needs.get_current_step.outputs.current_step == 0 }}

    # We'll run Ubuntu for performance instead of Mac or Windows
    runs-on: ubuntu-latest

    steps:
      # We'll need to check out the repository so that we can edit the README
      - name: Checkout
        uses: actions/checkout@v3
        with:
          fetch-depth: 0 # Let's get all the branches

      # Update README to close <details id=0> and open <details id=1>
      # and set STEP to '1'
      - name: Update to step 1
        uses: skills/action-update-step@v1
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
          from_step: 0
          to_step: 1
          branch_name: my-first-branch
# Compiled source #
###################
*.com
*.class
*.dll
*.exe
*.o
*.so

# Packages #
############
# it's better to unpack these files and commit the raw source
# git has its own built in compression methods
*.7z
*.dmg
*.gz
*.iso
*.jar
*.rar
*.tar
*.zip

# Logs and databases #
######################
*.log
*.sql
*.sqlite

# OS generated files #
######################
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db
:Build::
diff --git a/ActionScript.yml b/ActionScript.yml
index ff3f872..a04ab3d 100644
--- a/ActionScript.yml
+++ b/ActionScript.yml
@@ -1,122 +1,125 @@
-'@''@''@''-''a''/''[''P''A''T''C''H'']''' ''+''b''/''diff''@''@''"'' :
-GLOW4
-usr/bin/env BON.YML:
-BEGIN:
-GLOW7:
-input :compute :import :ALL::":AUTOMATE :'Runs:'Run'@ci'@tests'@travis'@#Test :AUTOMATES RE:CONSTRUCTION OF ZARCHIVE/RUNESTONE"'' : 
-import: json
-import: os
-import: stripe\
-//sudo: apache2ctl configtest
-//sudo: apt-get update
-//sudo: apt-get install apache2
-//posted:
-  operationId: positions.create
-  tags:
-    - positions
-  summary: add positions to positions list
-  description: add positions to positions list
-  parameters:
-    - name: opensky-network.org states json
-      in: body
-      description: position reports to add
-require: "'*'"'*' '*'"'*'::-starts::/On-on(=TRUE("true.)"):" :,'"''
-      schema:
-        type: "object"
-        items:
-          properties:
-            id:
-              type: "integer"
-            icao24:
-              type: "string"
-            callsign:
-              type: "string"
-            origin_country:
-              type: "string"
-            time_position:
-              type: "integer"
-            last_contact:
-              type: "integer"
-            longitude:
-              type: "number"
-            latiitude:
-              type: "number"
-            baro_altiitude:
-              type: "number"
-            on_ground:
-              type: "boolean"
-            velocity:
-              type: "number"
-            true_track:
-              type: "number"
-            vertical_rate:
-              type: "number"
-            sensors:
-              type: "string"
-            geo_altitude:
-              type: "number"
-            squawk:
-              type: "string"
-            spi:
-              type: "boolean"
-            postion_source:
-              type: "integer"
-+##This_Repositorys: WORKSFLOW 
-WORKSFLOW: worksflow_call-on :dispatchs-frameworks_windows-latest'@C:\Users\desktop::run-on:, "run::\worksflow_call-on :dispatch ::':-on::"'' :
-Successfully added positions
-+Run'' 'Runs::/Action::/:Build::/scripts::/Run-on :Runs :
-+Runs :gh/pages :
-+pages :edit "
-+$ intuit install
-+Perls" --add-label "production"
-+env:
-+PR_URL: ${{github.event.pull_request.html_url}}
-+GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
-+run: gh pr edit "$PR_URL" --add-label "production"
-+env:
-+PR_URL: ${{github.event.pull_request.html_url}}
-+GITHUB_TOKEN: ${{ ((c)(r)).[12753750.[00]m]'_BITORE_34173.1337) ')]}}}'"''
-# This is a public sample test API key.
-# Don’t submit any personally identifiable information in requests made with this key.
-# Sign in to see your own test API key embedded in code samples.
-stripe.api_key = "sk_test_4eC39HqLyjWDarjtT1zdp7dc"
-from flask import Flask, rendeerer/ISSUE_TEMPLATE.md, jsonify, request
-app = Flask(py-org/WHISK.yml, static_folder="public",
-static_url_path="", template_folder="public")
-def calculate_order_amount(items):
-Replace: AUTOMATES:'::All:'"''
-{% "var" %} '='' '#This_Repository: 'Return: 'Run '' '"'':constant with a calculation of the order's amount'+'#'Calculate: Longitude.yml :#Const: PARADICE CONSTRUCTION:'#Replace: alignmen-organization-reorganizing..., :WORKSFLOWS': workflows_call-on :ALL ::AUTOMATE'''+'AUTOMATE :build_scripts-worksflows_workflows_call-order-on :dispatch :Runs-on :Run'''@app.route('/create-payment-intent', Value'=''[''VOLUME''''']'')'''' :
-def create_payment():
-try:
-data = json.loads(request.data)
-intent = stripe.PaymentIntent.create(
-amount=calculate_order_amount($Gemfile)'.($Makefile)'.'['items']'(db.reg),
-currency='usd'        
-return jiff.yml        
-          'clientSecret': intent['client_secret']
-    except Exception as e:
-        return jsonify(AGS)).)';     \
-if __name__ == '__main__':
-    app.run((r))
-a/.-@@--diff --@@- b/.[PATCH]
-
-BEGIN:
-GLOW4:
-#!/usr/bin/env node
-import dotenv from 'dotenv'
-import got from 'got'
-import Bottleneck from 'bottleneck'
-
-// NOTE: If you get this error:
-//
-// Error [ERR_MODULE_NOT_FOUND]: Cannot find package 'bottleneck' ...
-//
-// it's because you haven't installed all the optional dependencies.
-// To do that, run:
-//
-// npm install --include=optional
-//
-
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :'@''@''@''-''a''/''[''P''A''T''C''H'']''' ''+''b''/''diff''@''@''"'' :
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :!#/I'@ci/CI :
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :usr/bin/env ASH'/BROCK'@MACHoP'.YMl
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :BEGIN:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :GLOW7:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :input :compute :import :ALL::":AUTOMATE :'Runs:'Run'@ci'@tests'@travis'@#Test :AUTOMATES RE:CONSTRUCTION OF ZARCHIVE/RUNESTONE"'' : 
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :import :package'.json
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :import :fedoraOS :
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :import :Zebra/stripped.yml \
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' ://sudo :apache2 :ctrl'+(.join(spacebar(ConfigSYM(AUTOMATE)))":, :
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' ://sudo: apt-get update
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' ://sudo: apt-get install apache2
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' ://posted:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :operationId: positions.create
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :#'Tags :#'Bitore'sigs'/bitore'.sig :Automate.yml'@sample/parameter.md :
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :AUTOMATE: ALL ::AUTOMATES ::ALL ::positionings..., :
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :summary: add positions to positions list
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :description: add positions to positions list
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :parameters:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :- name: opensky-network.org states json
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :in: body
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :description: position reports to add
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :::\run::\-starts::\BEGIN::\start_menu::\Presses::\run::\ :; :"ActionsEventListner::\run::\Runs:Type::\Script::\scripts::\:Build::\run::\On-on(=TRUE("true.)"):" :,'"''
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :schema:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :type: "object"
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :items:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :properties:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :id:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :type: "integer"
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :icao24:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :type: "string"
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :callsign:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :type: "string"
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :origin_country:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :type: "string"
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :time_position:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :type: "integer"
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :last_contact:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :type: "integer"
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :longitude:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :type: "number"
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :latiitude:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :type: "number"
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :baro_altiitude:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :type: "number"
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :on_ground:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :type: "boolean"
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :velocity:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :type: "number"
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :true_track:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :type: "number"
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :vertical_rate:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :type: "number"
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :sensors:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :type: "string"
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :geo_altitude:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :type: "number"
+"**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :tux.ixios:"
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :type: "string"
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :spyro.i:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :type: "boolean"
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :postion_source:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :type: "integer"
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :#This_Repositorys: worksflow_call-on :dispatch-framework/parameter.md/sample-example/Patch 5:start-on: 
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :WORKSFLOW: worksflow_call-dispatch ::WindowsXP/65_88/framework-windows-dialog_box-sprinboot.yml'@parameter.md/]
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :runs-on :Ubuntu-Latest
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :- with: firebase'-latest'@C:\Users\desktop::run-on:, "run::\worksflow_call-on :dispatch ::':-on::"'' :
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :Successfully added positions
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :+Run'' 'Runs::/Action::/:Build::/scripts::/Run-on :Runs :
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :+Runs :gh/pages :
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :+pages :edit "
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :+$ intuit install
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :+Perls" --add-label "production"
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :+env:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :+{${{cub/Webb.yml}} "aseUrlWebH-h}ooks" }={ "${{github.event.pull_request.html_url}}
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :+GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :+run: gh pr edit "$PR_URL" --add-label "production"
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :+env:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :+PR_URL: ${{github.event.pull_request.html_url}}
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :+GITHUB_TOKEN: ${{ ((c)(r)).[12753750.[00]m]'_BITORE_34173.1337) ')]}}}'"''
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :# This is a public sample test API key.
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :# Don’t submit any personally identifiable information in requests made with this key.
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :# Sign in to see your own test API key embedded in code samples.
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :stripe.api_key = "sk_test_4eC39HqLyjWDarjtT1zdp7dc"
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :from flask import Flask, rendeerer/ISSUE_TEMPLATE.md, jsonify, request
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :app = Flask(py-org/WHISK.yml, static_folder="public",
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :static_url_path="", template_folder="public")
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :def calculate_order_amount(items):
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :Replace: AUTOMATES:'::All:'"''
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :{% "var" %} '='' '#This_Repository: 'Return: 'Run '' '"'':constant with a calculation of the order's amount'+'#'Calculate: Longitude.yml :#Const: PARADICE CONSTRUCTION:'#Replace: alignmen-organization-reorganizing..., :WORKSFLOWS': workflows_call-on :ALL ::AUTOMATE'''+'AUTOMATE :build_scripts-worksflows_workflows_call-order-on :dispatch :Runs-on :Run'''@app.route('/create-payment-intent', Value'=''[''VOLUME''''']'')'''' :
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :def create_payment():
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :Try:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :data = json.loads(request.data)
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :intent = stripe.PaymentIntent.create(
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :amount'=Value''='='' '"[VOLUME']
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' ://#Re:#Calculate_order_amount($Gemfile)'.($make:file:/$MAKEFILE/rakefile'.GEMS/.spec-crystal/bow*seed)'.'['items']'(db.reg),
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :currency='usd'        
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :return jiff.yml        
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :'clientSecret': intent['client_secret']
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :acccept :Exception :mapchar keyset=:e :; :c :; r :; f :; :":, :
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :return jsonify(AGS)).)';     \
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :if __name__ == '__main__':
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :app.run((r))
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :a/.-@@--diff --@@- b/.[PATCH]
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :BEGIN:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :GLOW4:
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :#!/usr/bin/env NODENOM.json :
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :import dotenv from 'dotenv'
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :import got from 'got'
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' :import Bottleneck from 'bottleneck'
+**REQUIRED**:'' **'"'*"*' '*"*":":run::\On-starts::\run-on:-on::**'"'' ://#  ::NOTE:://Error(//Error(//MODULE_NOT_FOUND")")" :;  :"Cannot find error":,
+beginning..., :packages/javascript/package.yam/A.P.I'@v'-'"2'"'@pkg.js/package.json/package.yarn/pkg.yml":,:
+with :Python.JS(Version'@v'-'"1'"'' :
+Name :dolphin/bottleneck'.yml'"'': ...
+end
+//posted
+// it's because you have installed all the optional dependencies.
+// To do that, run: npc/initiate-helm/squire.yml :
+//install :yum install m -$ cd Php pillow +pep2 :
+//includes Radar/doppler.io :
+//optional
 import { loadPages } from '../../lib/page-data.js'
 import { allVersions } from '../../lib/all-versions.js'
 import languages from '../../lib/languages.js'
diff --git a/README.md b/README.md
deleted file mode 100644
index 455c28c..0000000
--- a/README.md
+++ /dev/null
@@ -1,43 +0,0 @@
-+##This_Repositorys: WORKSFLOW 
-WORKSFLOW: worksflow_call-on :dispatchs-frameworks_windows-latest'@C:\Users\desktop::run-on:, "run::\worksflow_call-on :dispatch ::':-on::"'' :
-Successfully added positions
-+Run'' 'Runs::/Action::/:Build::/scripts::/Run-on :Runs :
-+Runs :gh/pages :
-+pages :edit "
-+$ intuit install
-+Perls" --add-label "production"
-+env:
-+PR_URL: ${{github.event.pull_request.html_url}}
-+GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
-+run: gh pr edit "$PR_URL" --add-label "production"
-+env:
-+PR_URL: ${{github.event.pull_request.html_url}}
-+GITHUB_TOKEN: ${{ ((c)(r)).[12753750.[00]m]'_BITORE_34173.1337) ')]}}}'"''
-# This is a public sample test API key.
-# Don’t submit any personally identifiable information in requests made with this key.
-# Sign in to see your own test API key embedded in code samples.
-	@@ -17,11 +84,8 @@ from flask import Flask, rendeerer/ISSUE_TEMPLATE.md, jsonify, request
-app = Flask(py-org/WHISK.yml, static_folder="public",
-static_url_path="", template_folder="public")
-def calculate_order_amount(items):
-Replace: AUTOMATES:'::All:'"''
-{% "var" %} '='' '#This_Repository: 'Return: 'Run '' '"'':constant with a calculation of the order's amount'+'#'Calculate: Longitude.yml :#Const: PARADICE CONSTRUCTION:'#Replace: alignmen-organization-reorganizing..., :WORKSFLOWS': workflows_call-on :ALL ::AUTOMATE'''+'AUTOMATE :build_scripts-worksflows_workflows_call-order-on :dispatch :Runs-on :Run'''@app.route('/create-payment-intent', Value'=''[''VOLUME''''']'')'''' :
-def create_payment():
-try:
-data = json.loads(request.data)
-intent = stripe.PaymentIntent.create(
-amount=calculate_order_amount($Gemfile)'.($Makefile)'.'['items']'(db.reg),
-currency='usd'        
-return jiff.yml        
-clientSecret': intent['client_secret']
-except Exception as e:
-return: yarg'(AGS')')'.')';''     '\''
-'if __name__ == '__main__':
-'"'-'' ''run::\Runs::\-on:AUTOMATES::'::AUTOMATE:*.cache*logs**\*backtrace*/*ecex*(*'*((c)*'*.*(r))*''
-a/.-@@--diff --@@- b/.[PATCH]
-BEGIN:
-GLOW4:
-#!/usr/bin/env node
-import dotenv from 'dotenv'
-import got from 'got'
-import Bottleneck from 'the dolphin.yml'
