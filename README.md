# bootstrap-private-repos

simply installs packages listed in the package.json under "privateDependencies" like this:
```
{
  "scripts": {

    ...

    "postinstall": "node node_modules/@plan8/bootstrap-private-repos/src/index.js"
  },

  ...

  privateDependencies: {
    "@organization/reponame": "branch",
    "@organization/reponame": "branch"
  }
}
```


