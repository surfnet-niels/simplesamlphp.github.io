name: docs_pages_workflow

# execute this workflow automatically when a we push to master
on:
  push:
    branches: [ master ]

jobs:

  build_docs_job:
    runs-on: ubuntu-latest
    container: debian:buster-slim

    steps:

    - name: Prereqs
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      run: |
        apt-get update
        apt-get install -y git
        git clone --depth 1 "https://token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" .
      shell: bash

    - name: Execute script to build our documentation and update pages
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      run: "docs/build-docs.sh"
      shell: bash
