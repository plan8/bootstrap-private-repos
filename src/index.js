const fs = require("fs");
const { execSync } = require("child_process");
const path = require("path");

const packageJSON = fs.readFileSync("package.json");
const config = JSON.parse(packageJSON);

const dependencies = config.privateDependencies;

if (dependencies) {
  Object.entries(dependencies).forEach((keyVal) => {
    const [dependency, branch] = keyVal;
    const [namespace, repo] = dependency.split("/");

    const scriptPath = path.join(__dirname, "bootstrapDependencies.sh");

    const output = execSync(
      `${scriptPath} ${namespace.split("@").join("")} ${repo} ${branch}`
    );

    console.log(output.toString());
  });
}
