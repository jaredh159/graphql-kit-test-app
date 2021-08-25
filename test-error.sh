curl -g \
-X POST \
-H "Content-Type: application/json" \
-d '{"query":"query { order: getOrder(id: \"FBF9C172-E57E-49A8-8806-85F6C923E55A\") { id, items { title } } }"}' \
http://127.0.0.1:8080/graphql
