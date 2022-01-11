const fs = require('fs');
const { execSync } = require('child_process');

const packageJSON = fs.readFileSync('package.json');
const config = JSON.parse(packageJSON);

const dependencies = config.privateDependencies;

Object.entries(dependencies)
  .forEach(keyVal => {
    const [ dependency, branch ] = keyVal;
    const [ namespace, repo ] = dependency.split('/');

    const output = execSync(`scripts/bootstrapDependencies.sh ${namespace.split('@').join('')} ${repo} ${branch}`);
    console.log(output.toString());
  });
