Github revision:

Git vs GitHub (also GitHub Desktop):

> Git
    - Software to install in our machine
    - command line tool
    - version control using repositories in local machine


> Github
    - Online portal where we can upload repositories and collaborate

> Github Desktop
    - It is sort of a bridge between Git and GitHub
    - GUI for Git

How to create new local repository?
    - run command: git init

What is commit?
    - saving a new version of our project on git.
    - can we commit more than one file at once?
        yes, we can commit more than one file at once.
    
How to commit files or changes?
    - VS Code, source control tab
        - stage all the files which we want to commit
        - write commit message
        - commit
    - Terminal of VS Code
        - run command to add files to staging area: git add
        - run command to commit all files with message: git commit -am "your message"
    - GitHub Desktop
        - select files which we want to commit
        - write commit message
        - commit

Remote repo means online repositor, for us Repo on GitHub.
Remote --> local
    - clone repository.
    - Github portal, open with github desktop


Move local git changes to remote(on github)
    - git push

> Someone else is updating third file directly on github.
    - we want this change in our local machine
  
    - steps?
         - git pull 
         - or fetch origin from github desktop



How to implement a new functionality?
    - create new feature branch from master
        - implement the code.
        - commit all the changes.
        - publish new branch on GitHub
    - create new PR (pull request)
        - lead will check or not
        - merge to master
    - how to get latest master branch in local git?
        - git pull