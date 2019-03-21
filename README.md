# zeppelin-glue
docker-compose project for easier local AWS Glue development

# Setup
1. Create an AWS Glue development endpoint (see [the tutorial](https://docs.aws.amazon.com/glue/latest/dg/dev-endpoint-tutorial-prerequisites.html))
2. Create or move your private SSH key to `zeppelin-glue/keys/key.pem`

# Usage
`./start.sh <endpoint-name>` in the root directory.

You should now have Zeppelin running on http://localhost:8080 with the necessary interpreter configurations already tweaked for AWS Glue. Your notebooks and logs will persist to their relative directories in this project.
