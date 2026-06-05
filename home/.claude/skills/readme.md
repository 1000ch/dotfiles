# Claude Code skills

Personal [skills](https://docs.claude.com/en/docs/claude-code/skills) managed in dotfiles.

`setup.sh` symlinks this directory to `~/.claude/skills`, so any skill placed
here becomes available in Claude Code.

## Adding a skill

Create one directory per skill with a `SKILL.md` inside:

```
home/.claude/skills/
  my-skill/
    SKILL.md
```

`SKILL.md` needs YAML frontmatter with `name` and `description`:

```markdown
---
name: my-skill
description: What it does and when Claude should use it.
---

Instructions for the skill go here.
```
