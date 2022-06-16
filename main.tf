resource "genesyscloud_integration_action" "action" {
    name           = var.action_name
    category       = var.action_category
    integration_id = var.integration_id
    secure         = var.secure_data_action
    
    contract_input  = jsonencode({
        "additionalProperties" = true,
        "properties" = {
            "department" = {
                "type" = "string"
            },
            "divisionId" = {
                "type" = "string"
            },
            "email" = {
                "type" = "string"
            },
            "name" = {
                "type" = "string"
            },
            "state" = {
                "type" = "string"
            },
            "title" = {
                "type" = "string"
            }
        },
        "type" = "object"
    })
    contract_output = jsonencode({
        "additionalProperties" = true,
        "properties" = {
            "id" = {
                "type" = "string"
            }
        },
        "type" = "object"
    })
    
    config_request {
        request_template     = "$${input.rawRequest}"
        request_type         = "POST"
        request_url_template = "/api/v2/users"
    }

    config_response {
        success_template = "$${rawResult}"
    }
}