
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
