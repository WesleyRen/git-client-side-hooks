
# git-hooks-demo
Client side hooks .git/hooks are not maintained and checked in git repo.
So we need Husky.

1. Install husky and pinst (optional)

**npm**
```shell
npm install husky --save-dev
npm install pinst --save-dev # if your package is not private
```

**yarn**
```shell
yarn add husky --dev
yarn add pinst --dev # if your package is not private
```

2. Enable Git hooks
```shell
npx husky install
yarn husky install
```

3. To automatically have Git hooks enabled after install, edit package.json

*in package.json*
```json
{
    "private": true,
    "scripts": {
        "postinstall": "husky install"
    }
}
```

note: if your package is not private, and you're publishing it on a registry like npmjs.com, you need to disable postinstall script using pinst. Otherwise, postinstall will run when someone installs your package and result in an error.
See package.json in this repo.

4. Add pre-commit
```shell
npx husky add .husky/pre-commit "npm test"
```

5. Install (It seems that I needed to run `husky install` again after adding the scripts). `npm install` will trigger it too.
```
npm install
```


https://gecgithub01.walmart.com/wren1/git-hooks-demo.git/README.md
