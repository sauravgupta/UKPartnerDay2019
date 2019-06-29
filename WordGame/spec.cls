Class WordGame.spec Extends %REST.Spec [ ProcedureBlock ]
{

XData OpenAPI [ MimeType = application/json ]
{
{
  "swagger":"2.0",
  "info":{
    "title":"Word Game",
    "version":"1.0.1",
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
    },
    "/words":{
      "post":{
        "summary":"Add a word to the dictionary",
        "operationId":"AddWord",
        "responses":{
          "200":{
            "description":"success"
          }
        },
        "parameters":[
          {
            "in":"body",
            "name":"body",
            "required":true,
            "schema":{
              "$ref":"#/definitions/Word"
            }
          }
        ]
      }
    }
  },
  "definitions":{
    "Word":{
      "type":"object",
      "properties":{
        "word":{
          "type":"string"
        }
      }
    },
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
