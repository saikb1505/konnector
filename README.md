List Of Users:
curl -X GET http://localhost:3000/api/users 

Filter Request:

curl -X GET "http://localhost:3000/api/users/filter?campaign_names=cam1,cam2"



Create Request:

curl -X POST http://localhost:3000/api/users \
-H "Content-Type: application/json" \
-d '{
  "user": {
    "name": "User20",
    "email": "user20@example.com",
    "campaigns_list": [
      {"campaign_name": "campaignB", "campaign_id": "idB5"},
      {"campaign_name": "campaignX", "campaign_id": "idX9"}
    ]
  }
}'

