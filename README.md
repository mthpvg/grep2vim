# grep2vim
Seamlessly open files found by grep in vim at the right line.

## Quick start
```bash
git clone git@github.com:mthpvg/grep2vim.git
cd grep2vim
bash grep2vim.sh -inr boldYellow
```

## Preview
![Preview](/images/preview.gif)

## Warning
Unlike grep:
```bash
grep [OPTION]... PATTERN [FILE]...
```
It does not take a third argument:
```bash
bash grep2vim.sh [OPTION]... PATTERN
```