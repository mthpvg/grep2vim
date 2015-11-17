# grep2vim
Seamlessly open files found by grep in vim at the right line.

## Quick start
```bash
git clone git@github.com:mthpvg/grep2vim.git
cd grep2vim
bash grep2vim.sh -inr boldYellow
```

## Preview
![Preview](/images/grep2vim.gif)

## Use from anywhere (Ubuntu 14.04 LTS)
```bash
cd && mkdir .mthpvg && cd .mthpvg
git clone git@github.com:mthpvg/grep2vim.git
cp grep2vim/grep2vim.sh .
rm -rf grep2vim
echo "alias grep2vim='bash ~/.mthpvg/grep2vim.sh'" >> ~/.bashrc
source ~/.bashrc
grep2vim -inr boldYellow
```

## Warning
Unlike grep:
```bash
grep [OPTION]... PATTERN [FILE]...
```
It does not take a third argument:
```bash
bash grep2vim.sh [OPTION]... PATTERN
```

## To do
https://sift-tool.org/info