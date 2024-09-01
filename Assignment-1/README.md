# Assignment 1

For this assignment I created a private repository using GitHub and cloned it locally using the Terminal. 
I initially cloned it through PyCharm but when it came time to push the changes I had done I wasn’t able 
to proceed due to an authentication error. To remedy the situation I deleted the local repository and cloned 
it securely using the SSH url from GitHub. 

After making changes to the README and .gitignore files, I staged, committed, and pushed the changes.

Next, I created a branch and created an assignment folder with a README file. After committing these changes
I created a screenshots folder and updated the README file. I committed these changes before going on to 
create a requirements file and amending the README file to explain its use. After the final commit I 



_Please find screenshots of the processes I followed for this assignment in the Screenshots folder and below 
a list of what each one is_

* screenshot1: Creation of CFG-Assignments repository
* screenshot2: Cloning CFG-Assignments repository through terminal
* screenshot3: Use of git status
* screenshot4: Creating commit message
* screenshot5: Use of git add, commit, and push
* screenshot6: Creating Assignment1 folder and README file
* screenshot7: Use of git commit and status in branch
* screenshot8: Creating Screenshots folder and 2nd commit in branch
* screenshot9: Creating requirements file and updating README and screenshots
 



## Additional files

### .gitignore
The **.gitignore** file is used to tell your version control system, in this case Git, 
what files and folders to not track and ignore in the project. This means that all 
files and folders listed in **.gitignore** won't be added to commits. This file needs 
to be in the root directory, which in this case is _CFG-Assignments_. Upon creating 
**.gitignore** I added the Python template, which will exclude all files and folders 
listed in the template. I also deleted the **__#__** symbol from row 162, effectively 
removing the comment so that it ignores the _idea_ folder.


### Requirements.txt

The requirements.txt file is used to provide a list of external packages and their versions
required for a Python project that need to be installed by pip. This ensures that everyone working
on the same project will install the same packages and be able to work cohesively.

