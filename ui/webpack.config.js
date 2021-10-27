const path = require("path");
const TsconfigPathsPlugin = require("tsconfig-paths-webpack-plugin");

const configVars = {
    output: path.resolve(__dirname, "dist")
};

module.exports = (env, argv) => {
    return {
        entry: {
            module: "./src/index.ts"
        },
        output: {
            path: configVars.output,
            filename: "module.js"
        },
        resolve: {
            extensions: [".ts", ".tsx", ".js"],
            plugins: [new TsconfigPathsPlugin()]
        },
        devtool: "source-map",
        module: {
            rules: [
                {
                    test: /\.tsx?$/,
                    loader: "awesome-typescript-loader",
                    exclude: /node_modules/
                },
                {
                    test: /\.css$/i,
                    use: ["style-loader", "css-loader"]
                }
            ]
        },
        watch: argv.mode == "development"
    };
};
