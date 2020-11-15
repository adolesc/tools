# git和github操作指南

## git 

[git学习](https://www.liaoxuefeng.com/wiki/896043488029600)

```shell
##########
## 基本操作
##########
# git仓库初始化（切换到指定git仓库目录）
git init
# 添加到暂存区
git add .
# 提交
git commit -m "提交注释"
# 查看状态
git status
# 查看文件修改内容
git diff 文件名 

##########
## 版本回退
##########
# 查看提交历史
git log  或者  git log --pretty=oneline
# 回退上一个版本
git reset --hard HEAD^
# 回到指定版本
git reset --hard 版本号前几位
# 查看每次操作对应的版本号
git reflog
# 查看工作区和版本库里面最新版本的区别
git diff HEAD -- 文件名
# 文件回到最近一次git commit或git add时的状态
git checkout -- 文件名
# 把暂存区的修改撤销掉
git reset HEAD <file>
# 从版本库删除文件
rm <file> 
git rm <file>
git commit
# 恢复删除文件
git checkout -- <file>


##########
## 分支
##########

# 3.查看分支
git branch -a
# 4. 查看当前分支
git branch
# 创建分支
git branch 分支名称
# 删除分支
git branch -d 分支名称
# 删除远程分支
git push origin --delete 分支名称
# 切换分支
git checkout 分支名称  /  git switch -c <分支名称>  # -c :创建并切换分支
# git 本地分支合并
git checkout master
git merge --no-ff aa 
	# 将aa分支合并到master,如果两个分支都有修改，执行该命令后，编辑冲突文件，重新add,commit即可
	# --no-ff:https://blog.csdn.net/zombres/article/details/82179122
# 建立本地分支和远程分支的链接
git branch --set-upstream-to=origin/dev dev
# 暂停/隐藏当前工作
git stash
	# 恢复
	git stash apply	#恢复后，stash内容并不删除，你需要用git stash drop来删除
	git stash pop   # 恢复的同时把stash内容也删了
	git stash list  # 查看stach列表
    git stash apply stach@{0}  # 恢复某个stach
    
    
    
# 复制一个特定的提交到当前分支：4c805e2 fix bug 101
git cherry-pick 4c805e2
# 强行删除一个没有合并的分支
git branch -D <分支名称>
# 把分叉的提交历史“整理”成一条直线，看上去更直观
git rebase  # 缺点是本地的分叉提交已经被修改过了


# git 标签  类似快照
# 切换到需要打标签的分支  git checkout master
# git tag v1.0
# 查看所有标签：git tag
# git tag v0.9 id   # 打标签在指定日志id
# git show <标签名称> # 查看标签详情

# 创建带有说明的标签，用-a指定标签名，-m指定说明文字
git tag -a v0.1 -m "version 0.1 released" 1094adb
# 删除标签
git tag -d <标签名称>

# 推送标签到远程
git push origin v1.0  # 推送某个版本
git push origin --tags # 推送所有标签
# 删除远程标签（先删本地，再删远程）
git tag -d <tagname>
git push origin :refs/tags/<tagname>




```

## git 整合github

```shell
git config --global user.name "你的用户名"（注册github时填写的用户名）
git config --global user.email "你的邮箱"（注册github时填写的邮箱）
# 生成密钥：
ssh-keygen -t rsa -C "youremail@example.com"
# 复制id_rsa.pub内容到：GitHub-->Account settings-->SSH Keys-->Add SSH Key-->key
# clone远程代码
git clone 远程仓库地址
# 添加远程项目地址
git remote add origin <项目地址>
# 更换远程项目地址
git remote rm origin
git remote add origin <url>
# 查看远程仓库地址
git remote -v

# 推送本地代码到github
git push -u origin master   
	## -u 不但会把本地的master分支内容推送的远程新的master分支，还会把本地的master分支和远程的	
	##  master分支关联起来
	## origin:远程库的名称，git默认为origin
	## 之后使用：git push origin master
# 更新远程代码
git pull

```

![](git%E5%AD%A6%E4%B9%A0%E7%AC%94%E8%AE%B0.assets/1605421979151.png)

