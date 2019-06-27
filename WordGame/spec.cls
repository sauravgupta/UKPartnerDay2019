Class WordGame.spec Extends %REST.Spec [ ProcedureBlock ]
{

XData OpenAPI [ MimeType = application/json ]
{
{
  "swagger":"2.0",
  "info":{
    "title":"Word Game",
    "version":"1.0.0",
    "description":"REST backend for Scramble word game"
  },
  "paths":{
    "/score/{word}":{
      "get":{
        "summary":"Return the score for the provided word",
        "operationId":"Score",
        "responses":{
          "200":{
            "description":"success",
            "schema":{
              "$ref":"#/definitions/Score"
            }
          }
        },
        "produces":[
          "application/json"
        ],
        "parameters":[
          {
            "in":"path",
            "name":"word",
            "required":true,
            "type":"string"
          }
        ]
      }
    }
  },
  "definitions":{
    "Score":{
      "type":"object",
      "properties":{
        "score":{
          "type":"integer"
        }
      }
    }
  }
}
}

}
