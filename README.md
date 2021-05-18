# action-template

[![Test](https://github.com/asaasdev/checkstyle-action/workflows/Test/badge.svg)](https://github.com/asaasdev/checkstyle-action/actions?query=workflow%3ATest)
[![reviewdog](https://github.com/asaasdev/checkstyle-action/workflows/reviewdog/badge.svg)](https://github.com/asaasdev/checkstyle-action/actions?query=workflow%3Areviewdog)
[![depup](https://github.com/asaasdev/checkstyle-action/workflows/depup/badge.svg)](https://github.com/asaasdev/checkstyle-action/actions?query=workflow%3Adepup)
[![release](https://github.com/asaasdev/checkstyle-action/workflows/release/badge.svg)](https://github.com/asaasdev/checkstyle-action/actions?query=workflow%3Arelease)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/reviewdog/action-template?logo=github&sort=semver)](https://github.com/asaasdev/checkstyle-action/releases)
[![action-bumpr supported](https://img.shields.io/badge/bumpr-supported-ff69b4?logo=github&link=https://github.com/haya14busa/action-bumpr)](https://github.com/haya14busa/action-bumpr)

## Input

```yaml
inputs:
  github_token:
    description: 'GITHUB_TOKEN'
    default: '${{ github.token }}'
  workdir:
    description: 'Working directory relative to the root directory.'
    default: '.'
  ### Flags for reviewdog ###
  level:
    description: 'Report level for reviewdog [info,warning,error]'
    default: 'error'
  reporter:
    description: 'Reporter of reviewdog command [github-pr-check,github-check,github-pr-review].'
    default: 'github-pr-check'
  filter_mode:
    description: |
      Filtering mode for the reviewdog command [added,diff_context,file,nofilter].
      Default is added.
    default: 'added'
  fail_on_error:
    description: |
      Exit code for reviewdog when errors are found [true,false]
      Default is `false`.
    default: 'false'
  reviewdog_flags:
    description: 'Additional reviewdog flags'
    default: ''
  ### Parameters for checkstyle ###
  configuration_file:
    description: '-c parameter. Specifies the location of the file that defines the configuration modules.'
    default: 'google_checks.xml'
```

## Usage

```yaml
name: checkstyle
on: [pull_request]
jobs:
  linter_name:
    name: runner / checkstyle
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: asaasdev/checkstyle-action@v1
        with:
          github_token: ${{ secrets.github_token }}
          # Change reviewdog reporter if you need [github-pr-check,github-check,github-pr-review].
          reporter: github-pr-review
          # Change reporter level if you need.
          # GitHub Status Check won't become failure with warning.
          level: warning
```
