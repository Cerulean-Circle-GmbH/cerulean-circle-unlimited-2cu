# 🛡️ Branch Protection Setup Guide

**Protect your main branch** with GitHub's branch protection rules

## Overview

Branch protection rules ensure the main branch remains stable by requiring checks and reviews before changes are merged.

## Setup Instructions

### 1. Navigate to Branch Protection Settings

1. Go to your repository on GitHub
2. Click **Settings** → **Branches**
3. Click **Add rule** under "Branch protection rules"

### 2. Configure Protection Rules

#### Branch name pattern
```
main
```

#### Protection Settings

**✅ Enable these protections:**

- [x] **Require a pull request before merging**
  - [x] Require approvals: 1
  - [x] Dismiss stale pull request approvals when new commits are pushed
  - [x] Require review from CODEOWNERS

- [x] **Require status checks to pass before merging**
  - [x] Require branches to be up to date before merging
  - Status checks:
    - `health-check`
    - `dual-context-sync`

- [x] **Require conversation resolution before merging**

- [x] **Include administrators**
  - Enforce all configured restrictions for administrators

- [x] **Restrict who can push to matching branches**
  - Add users/teams who can push directly (emergency only)

### 3. Additional Recommendations

#### Enable these for extra protection:

- [ ] **Require signed commits** (optional)
- [ ] **Require linear history** (optional)
- [ ] **Require deployments to succeed** (if applicable)

### 4. Save Rules

Click **Create** or **Save changes**

## Emergency Override

If you need to bypass protection temporarily:

1. **Option 1**: Disable "Include administrators" temporarily
2. **Option 2**: Create emergency PR with admin override
3. **Option 3**: Use repository settings to disable rule

**⚠️ Always re-enable after emergency!**

## Monitoring

### Check Protection Status

```bash
# Using GitHub CLI
gh api repos/:owner/:repo/branches/main/protection
```

### View Recent PR Checks

```bash
# List recent PRs
gh pr list --state all --limit 10
```

## Best Practices

1. **Never disable permanently** - Only for emergencies
2. **Document overrides** - Note why protection was bypassed
3. **Regular reviews** - Audit who has bypass permissions
4. **Test in dev first** - Try changes in feature branches

## Recovery Procedures

If main branch becomes corrupted despite protections:

1. **Automatic Recovery**
   - Health check workflow triggers recovery
   - Auto-recovery workflow attempts fixes

2. **Manual Recovery**
   ```bash
   ./maintenance/v2.0/src/auto-recovery.sh diagnose
   ./maintenance/v2.0/src/auto-recovery.sh recover
   ```

3. **Emergency Rollback**
   ```bash
   # Find last good commit
   git log --oneline -10
   
   # Reset to known good state
   git reset --hard <commit-hash>
   git push --force-with-lease
   ```

## Related Documentation

- [GitHub Actions Workflows](.github/workflows/)
- [Recovery Procedures](./dual-context-maintenance.md#emergency-procedures)
- [Health Check System](.github/workflows/health-check.yml)

---

**🔒 Remember**: Branch protection is your first line of defense against repository corruption. Keep it enabled!