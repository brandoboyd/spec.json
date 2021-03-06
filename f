{
    "openapi": "3.0.0",
    "info": {
        "title": "Tekion API Specification",
        "description": "# Tekion Open API\nTekion’s open API connect business through seamless integration. We provide API access to approved and certified organizations that work with our dealer partners. Our comprehensive list of APIs eliminated friction and promotes connection, communication and data exchange between businesses seamlessly.\n\n The API is defined using REST (Representational State Transfer) services returning JSON data.\n",
        "contact": {},
        "version": "1.0.2"
    },
    "servers": [
        {
            "url": "https://integration.tekioncloud.xyz/api/v2",
            "description": "Open Apis"
        },
        {
            "url": "https://integration.tekioncloud.xyz/auth/v1",
            "description": "Authorization"
        }
    ],
    "tags": [
        {
            "name": "Authorization"
        },
        {
            "name": "Customer"
        },
        {
            "name": "Vehicle"
        },
        {
            "name": "Appointment"
        },
        {
            "name": "Repairorder"
        },
        {
            "name": "Support API"
        }
    ],
    "paths": {
        "/oauth2/token": {
            "post": {
                "tags": [
                    "Authorization"
                ],
                "summary": "Tekion Authorization(use authorization host)",
                "operationId": "TekionAuthorization",
                "parameters": [
                    {
                        "name": "Content-Type",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string",
                            "default": "application/x-www-form-urlencoded"
                        }
                    },
                    {
                        "name": "client_id",
                        "in": "header",
                        "description": "Tekion clientId",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    }
                ],
                "requestBody": {
                    "content": {
                        "application/x-www-form-urlencoded": {
                            "schema": {
                                "$ref": "#/components/schemas/AuthorizationRequest"
                            }
                        }
                    },
                    "required": true
                },
                "responses": {
                    "200": {
                        "description": "OK",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/AuthorizationResponse"
                                }
                            }
                        }
                    },
                    "400": {
                        "description": "400 - Bad Request",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorBadRequest"
                                }
                            }
                        }
                    },
                    "401": {
                        "description": "401 - Unauthorized",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorUnauthorized"
                                }
                            }
                        }
                    },
                    "403": {
                        "description": "403 - Forbidden",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorForbidden"
                                }
                            }
                        }
                    }
                },
                "deprecated": false
            }
        },
        "/customer": {
            "get": {
                "tags": [
                    "Customer"
                ],
                "summary": "Customer Search",
                "operationId": "CustomerSearch",
                "parameters": [
                    {
                        "name": "Authorization",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string",
                            "default": "Bearer {token}"
                        }
                    },
                    {
                        "name": "lastName",
                        "in": "query",
                        "schema": {
                            "type": "string"
                        }
                    },
                    {
                        "name": "Content-Type",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string",
                            "default": "application/json"
                        }
                    },
                    {
                        "name": "dealerid",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    },
                    {
                        "name": "client_id",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    },
                    {
                        "name": "startTime",
                        "in": "query",
                        "description": "time in milliseconed",
                        "schema": {
                            "type": "string"
                        }
                    },
                    {
                        "name": "endTime",
                        "in": "query",
                        "description": "time in millisecond",
                        "schema": {
                            "type": "string"
                        }
                    }
                ],
                "responses": {
                    "200": {
                        "description": "OK",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/CustomerSearchResponse"
                                }
                            }
                        }
                    },
                    "400": {
                        "description": "400 - Bad Request",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorBadRequest"
                                }
                            }
                        }
                    },
                    "401": {
                        "description": "401 - Unauthorized",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorUnauthorized"
                                }
                            }
                        }
                    },
                    "403": {
                        "description": "403 - Forbidden",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorForbidden"
                                }
                            }
                        }
                    }
                },
                "deprecated": false
            },
            "put": {
                "tags": [
                    "Customer"
                ],
                "summary": "Customer Update",
                "operationId": "CustomerUpdate",
                "parameters": [
                    {
                        "name": "Authorization",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string",
                            "default": "Bearer {token}"
                        }
                    },
                    {
                        "name": "Content-Type",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string",
                            "default": "application/json"
                        }
                    },
                    {
                        "name": "dealerid",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    },
                    {
                        "name": "client_id",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    }
                ],
                "requestBody": {
                    "content": {
                        "application/json": {
                            "schema": {
                                "$ref": "#/components/schemas/CustomerUpdateRequest"
                            }
                        }
                    },
                    "required": true
                },
                "responses": {
                    "200": {
                        "description": "OK",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/CustomerUpdateResponse"
                                }
                            }
                        }
                    },
                    "400": {
                        "description": "400 - Bad Request",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorBadRequest"
                                }
                            }
                        }
                    },
                    "401": {
                        "description": "401 - Unauthorized",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorUnauthorized"
                                }
                            }
                        }
                    },
                    "403": {
                        "description": "403 - Forbidden",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorForbidden"
                                }
                            }
                        }
                    }
                },
                "deprecated": false
            },
            "post": {
                "tags": [
                    "Customer"
                ],
                "summary": "Customer Create",
                "operationId": "CustomerCreate",
                "parameters": [
                    {
                        "name": "Authorization",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string",
                            "default": "Bearer {token}"
                        }
                    },
                    {
                        "name": "Content-Type",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string",
                            "default": "application/json"
                        }
                    },
                    {
                        "name": "dealerid",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    },
                    {
                        "name": "client_id",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    }
                ],
                "requestBody": {
                    "content": {
                        "application/json": {
                            "schema": {
                                "$ref": "#/components/schemas/CustomerCreateRequest"
                            }
                        }
                    },
                    "required": true
                },
                "responses": {
                    "200": {
                        "description": "OK",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/CustomerCreateResponse"
                                }
                            }
                        }
                    },
                    "400": {
                        "description": "400 - Bad Request",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorBadRequest"
                                }
                            }
                        }
                    },
                    "401": {
                        "description": "401 - Unauthorized",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorUnauthorized"
                                }
                            }
                        }
                    },
                    "403": {
                        "description": "403 - Forbidden",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorForbidden"
                                }
                            }
                        }
                    }
                },
                "deprecated": false
            }
        },
        "/vehicle/customer": {
            "get": {
                "tags": [
                    "Vehicle"
                ],
                "summary": "Vehicle Search",
                "operationId": "VehicleSearch",
                "parameters": [
                    {
                        "name": "Authorization",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string",
                            "default": "Bearer {token}"
                        }
                    },
                    {
                        "name": "vin",
                        "in": "query",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    },
                    {
                        "name": "last8DigitVin",
                        "in": "query",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    },
                    {
                        "name": "Content-Type",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string",
                            "default": "application/json"
                        }
                    },
                    {
                        "name": "dealerid",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    },
                    {
                        "name": "client_id",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    }
                ],
                "responses": {
                    "200": {
                        "description": "OK",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/VehicleSearchResponse"
                                }
                            }
                        }
                    },
                    "400": {
                        "description": "400 - Bad Request",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorBadRequest"
                                }
                            }
                        }
                    },
                    "401": {
                        "description": "401 - Unauthorized",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorUnauthorized"
                                }
                            }
                        }
                    },
                    "403": {
                        "description": "403 - Forbidden",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorForbidden"
                                }
                            }
                        }
                    }
                },
                "deprecated": false
            }
        },
        "/vehicle": {
            "get": {
                "tags": [
                    "Vehicle"
                ],
                "summary": "Get Vehicle",
                "operationId": "GetVehicle",
                "parameters": [
                    {
                        "name": "Authorization",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string",
                            "default": "Bearer {token}"
                        }
                    },
                    {
                        "name": "vin",
                        "in": "query",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    },
                    {
                        "name": "Content-Type",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string",
                            "default": "application/json"
                        }
                    },
                    {
                        "name": "dealerid",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    },
                    {
                        "name": "client_id",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    }
                ],
                "responses": {
                    "200": {
                        "description": "OK",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/VehicleGetResponse"
                                }
                            }
                        }
                    },
                    "400": {
                        "description": "400 - Bad Request",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorBadRequest"
                                }
                            }
                        }
                    },
                    "401": {
                        "description": "401 - Unauthorized",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorUnauthorized"
                                }
                            }
                        }
                    },
                    "403": {
                        "description": "403 - Forbidden",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorForbidden"
                                }
                            }
                        }
                    }
                },
                "deprecated": false
            }
        },
        "/appointment": {
            "get": {
                "tags": [
                    "Appointment"
                ],
                "summary": "Appointment Search",
                "operationId": "AppointmentSearch",
                "parameters": [
                    {
                        "name": "Authorization",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string",
                            "default": "Bearer {token}"
                        }
                    },
                    {
                        "name": "id",
                        "in": "query",
                        "schema": {
                            "type": "string"
                        }
                    },
                    {
                        "name": "startTime",
                        "in": "query",
                        "schema": {
                            "type": "string"
                        }
                    },
                    {
                        "name": "endTime",
                        "in": "query",
                        "schema": {
                            "type": "string"
                        }
                    },
                    {
                        "name": "Content-Type",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string",
                            "default": "application/json"
                        }
                    },
                    {
                        "name": "dealerid",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    },
                    {
                        "name": "client_id",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    }
                ],
                "responses": {
                    "200": {
                        "description": "OK",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/AppointmentSearchResponse"
                                }
                            }
                        }
                    },
                    "400": {
                        "description": "400 - Bad Request",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorBadRequest"
                                }
                            }
                        }
                    },
                    "401": {
                        "description": "401 - Unauthorized",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorUnauthorized"
                                }
                            }
                        }
                    },
                    "403": {
                        "description": "403 - Forbidden",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorForbidden"
                                }
                            }
                        }
                    }
                },
                "deprecated": false
            },
            "put": {
                "tags": [
                    "Appointment"
                ],
                "summary": "Appointment Update",
                "operationId": "AppointmentUpdate",
                "parameters": [
                    {
                        "name": "Authorization",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string",
                            "default": "Bearer {token}"
                        }
                    },
                    {
                        "name": "Content-Type",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string",
                            "default": "application/json"
                        }
                    },
                    {
                        "name": "dealerid",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    },
                    {
                        "name": "client_id",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    }
                ],
                "requestBody": {
                    "content": {
                        "application/json": {
                            "schema": {
                                "$ref": "#/components/schemas/AppointmentUpdateRequest"
                            }
                        }
                    },
                    "required": true
                },
                "responses": {
                    "200": {
                        "description": "OK",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/AppointmentUpdateResponse"
                                }
                            }
                        }
                    },
                    "400": {
                        "description": "400 - Bad Request",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorBadRequest"
                                }
                            }
                        }
                    },
                    "401": {
                        "description": "401 - Unauthorized",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorUnauthorized"
                                }
                            }
                        }
                    },
                    "403": {
                        "description": "403 - Forbidden",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorForbidden"
                                }
                            }
                        }
                    }
                },
                "deprecated": false,
                "x-codegen-request-body-name": "Body"
            },
            "post": {
                "tags": [
                    "Appointment"
                ],
                "summary": "Appointment Create",
                "operationId": "AppointmentCreate",
                "parameters": [
                    {
                        "name": "Authorization",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string",
                            "default": "Bearer {token}"
                        }
                    },
                    {
                        "name": "Content-Type",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string",
                            "default": "application/json"
                        }
                    },
                    {
                        "name": "dealerid",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    },
                    {
                        "name": "client_id",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    }
                ],
                "requestBody": {
                    "content": {
                        "application/json": {
                            "schema": {
                                "$ref": "#/components/schemas/AppointmentCreateRequest"
                            }
                        }
                    },
                    "required": true
                },
                "responses": {
                    "200": {
                        "description": "OK",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/AppointmentCreateResponse"
                                }
                            }
                        }
                    },
                    "400": {
                        "description": "400 - Bad Request",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorBadRequest"
                                }
                            }
                        }
                    },
                    "401": {
                        "description": "401 - Unauthorized",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorUnauthorized"
                                }
                            }
                        }
                    },
                    "403": {
                        "description": "403 - Forbidden",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorForbidden"
                                }
                            }
                        }
                    }
                },
                "deprecated": false,
                "x-codegen-request-body-name": "Body"
            }
        },
        "/repairorder": {
            "get": {
                "tags": [
                    "Repairorder"
                ],
                "summary": "RepairOrder Search",
                "operationId": "RepairOrderCreate",
                "parameters": [
                    {
                        "name": "Authorization",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string",
                            "default": "Bearer {token}"
                        }
                    },
                    {
                        "name": "Content-Type",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string",
                            "default": "application/json"
                        }
                    },
                    {
                        "name": "dealerid",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    },
                    {
                        "name": "client_id",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    },
                    {
                        "name": "id",
                        "in": "query",
                        "schema": {
                            "type": "string"
                        }
                    },
                    {
                        "name": "startTime",
                        "in": "query",
                        "schema": {
                            "type": "string"
                        }
                    },
                    {
                        "name": "endTime",
                        "in": "query",
                        "schema": {
                            "type": "string"
                        }
                    }
                ],
                "responses": {
                    "200": {
                        "description": "OK",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/RepairOrderSearchResponse"
                                }
                            }
                        }
                    },
                    "400": {
                        "description": "400 - Bad Request",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorBadRequest"
                                }
                            }
                        }
                    },
                    "401": {
                        "description": "401 - Unauthorized",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorUnauthorized"
                                }
                            }
                        }
                    },
                    "403": {
                        "description": "403 - Forbidden",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorForbidden"
                                }
                            }
                        }
                    }
                },
                "deprecated": false
            }
        },
        "/transportationtype": {
            "get": {
                "tags": [
                    "Support API"
                ],
                "summary": "Transportation",
                "operationId": "Transportation",
                "parameters": [
                    {
                        "name": "Authorization",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string",
                            "default": "Bearer {token}"
                        }
                    },
                    {
                        "name": "Content-Type",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string",
                            "default": "application/json"
                        }
                    },
                    {
                        "name": "dealerid",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    },
                    {
                        "name": "client_id",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    }
                ],
                "responses": {
                    "200": {
                        "description": "OK",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/TransportationResponse"
                                }
                            }
                        }
                    },
                    "400": {
                        "description": "400 - Bad Request",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorBadRequest"
                                }
                            }
                        }
                    },
                    "401": {
                        "description": "401 - Unauthorized",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorUnauthorized"
                                }
                            }
                        }
                    },
                    "403": {
                        "description": "403 - Forbidden",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorForbidden"
                                }
                            }
                        }
                    }
                },
                "deprecated": false
            }
        },
        "/serviceshop": {
            "get": {
                "tags": [
                    "Support API"
                ],
                "summary": "Service Shop",
                "operationId": "ServiceShop",
                "parameters": [
                    {
                        "name": "Authorization",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string",
                            "default": "Bearer {token}"
                        }
                    },
                    {
                        "name": "Content-Type",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string",
                            "default": "application/json"
                        }
                    },
                    {
                        "name": "dealerid",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    },
                    {
                        "name": "client_id",
                        "in": "header",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    }
                ],
                "responses": {
                    "200": {
                        "description": "OK",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ServiceShopResponse"
                                }
                            }
                        }
                    },
                    "400": {
                        "description": "400 - Bad Request",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorBadRequest"
                                }
                            }
                        }
                    },
                    "401": {
                        "description": "401 - Unauthorized",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorUnauthorized"
                                }
                            }
                        }
                    },
                    "403": {
                        "description": "403 - Forbidden",
                        "headers": {
                            "Request-Id": {
                                "schema": {
                                    "type": "string"
                                }
                            }
                        },
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/ErrorForbidden"
                                }
                            }
                        }
                    }
                },
                "deprecated": false
            }
        }
    },
    "components": {
        "schemas": {
            "AuthorizationRequest": {
                "required": [
                    "access-key",
                    "secret-key"
                ],
                "type": "object",
                "description": "Api Authorization",
                "properties": {
                    "access-key": {
                        "type": "string"
                    },
                    "secret-key": {
                        "type": "string"
                    }
                }
            },
            "AuthorizationResponse": {
                "type": "object",
                "description": "Authorization token",
                "example": {
                    "access_token": "eyJraWQiOiJ3RjRqZ2dTeXR2c",
                    "expires_in": 86400,
                    "token_type": "Bearer"
                }
            },
            "CustomerSearchResponse": {
                "type": "object",
                "description": "Customer search",
                "example": {
                    "id": "7d789cb6-2887-4144-ac16-420d7ea00e08",
                    "arcId": "344229",
                    "customerType": "INDIVIDUAL",
                    "firstName": "emp",
                    "middleName": null,
                    "lastName": "bal",
                    "companyName": null,
                    "status": "ACTIVE",
                    "phones": [
                        {
                            "phoneType": "MOBILE",
                            "number": "0000000000",
                            "isPrimary": true
                        }
                    ],
                    "preferredContactType": "SMS",
                    "preferredCommunicationMode": "SMS",
                    "email": "shamanth@mailinator.com",
                    "communicationPreferences": {
                        "email": {
                            "serviceUpdates": true,
                            "marketing": true
                        },
                        "call": {
                            "serviceUpdates": true,
                            "marketing": true
                        },
                        "text": {
                            "serviceUpdates": true,
                            "marketing": true
                        },
                        "postalMail": {
                            "serviceUpdates": true,
                            "marketing": true
                        }
                    },
                    "vehicleInfo": {
                        "vin": "3GTP1PEC8JG264393",
                        "last8DigitVIN": "JG264393",
                        "id": "24e0371d-7b17-43a0-a5d6-f32d8e3d71bc",
                        "year": "2018",
                        "make": "GMC",
                        "model": "Sierra 1500",
                        "lastUpdatedTime": null,
                        "lastServiceTime": null
                    },
                    "addresses": [
                        {
                            "isCurrent": null,
                            "line1": "JP Nagar "
                        }
                    ],
                    "line2": null,
                    "city": "Bangalore",
                    "state": "KA",
                    "country": "India",
                    "zip": "56000",
                    "county": "India"
                }
            },
            "CustomerCreateResponse": {
                "type": "object",
                "description": "Customer create",
                "example": {
                    "id": "f588b123-a81d-4d87-b448-1c1b0be67234",
                    "arcId": "345119",
                    "customerType": "BUSINESS",
                    "firstName": "M&D",
                    "middleName": null,
                    "lastName": "Mahendra",
                    "alternateName": null,
                    "displayName": null,
                    "companyName": "M&D",
                    "status": "ACTIVE",
                    "phones": [
                        {
                            "phoneType": "HOME",
                            "number": "0008926073",
                            "isPrimary": false
                        },
                        {
                            "phoneType": "MOBILE",
                            "number": "0007795964",
                            "isPrimary": true
                        },
                        {
                            "phoneType": "WORK",
                            "number": "0007795962",
                            "isPrimary": true
                        }
                    ],
                    "preferredContactType": "EMAIL",
                    "preferredCommunicationMode": "EMAIL",
                    "email": "mandd.company@nodomain.com",
                    "communicationPreferences": {
                        "email": {
                            "isOptInService": true,
                            "isOptInMarketing": true
                        },
                        "call": {
                            "isOptInService": true,
                            "isOptInMarketing": true
                        },
                        "text": {
                            "isOptInService": true,
                            "isOptInMarketing": true
                        },
                        "mail": {
                            "isOptInService": true,
                            "isOptInMarketing": true
                        }
                    },
                    "addresses": [
                        {
                            "isCurrent": true,
                            "line1": "914 Beach Park Blvd",
                            "line2": "APT 21",
                            "zip": "70429",
                            "city": "Foster City",
                            "state": "CA",
                            "country": "USA",
                            "county": null
                        }
                    ]
                }
            },
            "CustomerCreateRequest": {
                "title": "CustomerCreateRequest",
                "required": [
                    "addresses",
                    "arcId",
                    "communicationPreferences",
                    "companyName",
                    "customerType",
                    "email",
                    "firstName",
                    "lastName",
                    "middleName",
                    "phones",
                    "preferredCommunicationMode",
                    "preferredContactType",
                    "status",
                    "vehicles"
                ],
                "type": "object",
                "properties": {
                    "arcId": {
                        "type": "string"
                    },
                    "customerType": {
                        "type": "string"
                    },
                    "firstName": {
                        "type": "string"
                    },
                    "middleName": {
                        "type": "string"
                    },
                    "lastName": {
                        "type": "string"
                    },
                    "companyName": {
                        "type": "string"
                    },
                    "status": {
                        "type": "string"
                    },
                    "phones": {
                        "type": "array",
                        "items": {
                            "$ref": "#/components/schemas/Phone"
                        }
                    },
                    "preferredContactType": {
                        "type": "string"
                    },
                    "preferredCommunicationMode": {
                        "type": "string"
                    },
                    "email": {
                        "type": "string"
                    },
                    "communicationPreferences": {
                        "$ref": "#/components/schemas/CommunicationPreferences"
                    },
                    "vehicles": {
                        "type": "array",
                        "items": {
                            "$ref": "#/components/schemas/Vehicle"
                        }
                    },
                    "addresses": {
                        "type": "array",
                        "items": {
                            "$ref": "#/components/schemas/Address"
                        }
                    }
                },
                "example": {
                    "arcId": "DN55119",
                    "customerType": "BUSINESS",
                    "firstName": "Dhoni",
                    "lastName": "Mahendra",
                    "companyName": "M&D",
                    "status": "ACTIVE",
                    "phones": [
                        {
                            "phoneType": "HOME",
                            "number": "0008926073",
                            "isPrimary": false
                        },
                        {
                            "phoneType": "MOBILE",
                            "number": "0007795964",
                            "isPrimary": true
                        },
                        {
                            "phoneType": "WORK",
                            "number": "0007795962",
                            "isPrimary": true
                        }
                    ],
                    "preferredContactType": "EMAIL",
                    "email": "mandd.company@nodomain.com",
                    "communicationPreferences": {
                        "email": {
                            "isOptInService": false,
                            "isOptInMarketing": false
                        },
                        "call": {
                            "isOptInService": false,
                            "isOptInMarketing": false
                        },
                        "text": {
                            "isOptInService": false,
                            "isOptInMarketing": false
                        },
                        "mail": {
                            "isOptInService": false,
                            "isOptInMarketing": false
                        }
                    },
                    "vehicles": [
                        {
                            "id": "60dd21c04cedfd0006e4e2f7",
                            "vin": "3GCUYDED89796402",
                            "year": 2022,
                            "make": "Chevrolet",
                            "model": "Silverado 1500",
                            "modelCode": "CK10543",
                            "manufacturerModelCode": "CK10543",
                            "modelType": "CREW LT 4WD",
                            "trimDetails": {
                                "trim": "LT",
                                "driveType": "Four Wheel Drive",
                                "aspiration": "Naturally Aspirated",
                                "engineSize": "5.3L",
                                "engineCylinders": 0,
                                "fuelType": "GAS",
                                "bodyType": "Crew Cab Pickup - Short Bed",
                                "axleCount": 0,
                                "bodyClass": "Truck/Van"
                            },
                            "exteriorColorCode": "GAZ",
                            "exteriorColor": "SUMMIT WHITE",
                            "interiorColorCode": "H0U",
                            "interiorColor": "JET BLACK",
                            "vehicleType": "NEW",
                            "vehicleSubType": "New Vehicle Purchase",
                            "isCertified": false,
                            "grossWeight": 7100,
                            "grossWeightUnit": "POUNDS",
                            "unladenWeight": 4920,
                            "unladenWeightUnit": "POUNDS",
                            "mileage": {
                                "unit": "MI",
                                "value": 3000
                            },
                            "mileageStatus": "ACTUAL",
                            "license": {
                                "plate": "8XB89Z",
                                "state": "CA",
                                "country": "US",
                                "expiryDate": 1629463324025
                            }
                        }
                    ],
                    "addresses": [
                        {
                            "isCurrent": true,
                            "line1": "914 Beach Park Blvd",
                            "line2": "APT 21",
                            "city": "Foster City",
                            "state": "CA",
                            "country": "USA",
                            "zip": "70429"
                        }
                    ]
                }
            },
            "Phone": {
                "title": "Phone",
                "required": [
                    "isPrimary",
                    "number",
                    "phoneType"
                ],
                "type": "object",
                "properties": {
                    "phoneType": {
                        "type": "string"
                    },
                    "number": {
                        "type": "string"
                    },
                    "isPrimary": {
                        "type": "boolean"
                    }
                },
                "example": {
                    "phoneType": "HOME",
                    "number": "0008926073",
                    "isPrimary": false
                }
            },
            "CommunicationPreferences": {
                "title": "CommunicationPreferences",
                "required": [
                    "call",
                    "email",
                    "mail",
                    "text"
                ],
                "type": "object",
                "properties": {
                    "email": {
                        "$ref": "#/components/schemas/Email"
                    },
                    "call": {
                        "$ref": "#/components/schemas/Call"
                    },
                    "text": {
                        "$ref": "#/components/schemas/Text"
                    },
                    "mail": {
                        "$ref": "#/components/schemas/Mail"
                    }
                },
                "example": {
                    "email": {
                        "isOptInService": false,
                        "isOptInMarketing": false
                    },
                    "call": {
                        "isOptInService": false,
                        "isOptInMarketing": false
                    },
                    "text": {
                        "isOptInService": false,
                        "isOptInMarketing": false
                    },
                    "mail": {
                        "isOptInService": false,
                        "isOptInMarketing": false
                    }
                }
            },
            "Email": {
                "title": "Email",
                "required": [
                    "isOptInMarketing",
                    "isOptInService"
                ],
                "type": "object",
                "properties": {
                    "isOptInService": {
                        "type": "boolean"
                    },
                    "isOptInMarketing": {
                        "type": "boolean"
                    }
                },
                "example": {
                    "isOptInService": false,
                    "isOptInMarketing": false
                }
            },
            "Call": {
                "title": "Call",
                "required": [
                    "isOptInMarketing",
                    "isOptInService"
                ],
                "type": "object",
                "properties": {
                    "isOptInService": {
                        "type": "boolean"
                    },
                    "isOptInMarketing": {
                        "type": "boolean"
                    }
                },
                "example": {
                    "isOptInService": false,
                    "isOptInMarketing": false
                }
            },
            "Text": {
                "title": "Text",
                "required": [
                    "isOptInMarketing",
                    "isOptInService"
                ],
                "type": "object",
                "properties": {
                    "isOptInService": {
                        "type": "boolean"
                    },
                    "isOptInMarketing": {
                        "type": "boolean"
                    }
                },
                "example": {
                    "isOptInService": false,
                    "isOptInMarketing": false
                }
            },
            "Mail": {
                "title": "Mail",
                "required": [
                    "isOptInMarketing",
                    "isOptInService"
                ],
                "type": "object",
                "properties": {
                    "isOptInService": {
                        "type": "boolean"
                    },
                    "isOptInMarketing": {
                        "type": "boolean"
                    }
                },
                "example": {
                    "isOptInService": false,
                    "isOptInMarketing": false
                }
            },
            "Vehicle": {
                "title": "Vehicle",
                "required": [
                    "exteriorColor",
                    "exteriorColorCode",
                    "grossWeight",
                    "grossWeightUnit",
                    "id",
                    "interiorColor",
                    "interiorColorCode",
                    "isCertified",
                    "license",
                    "make",
                    "manufacturerModelCode",
                    "mileage",
                    "mileageStatus",
                    "model",
                    "modelCode",
                    "modelType",
                    "trimDetails",
                    "unladenWeight",
                    "unladenWeightUnit",
                    "vehicleSubType",
                    "vehicleType",
                    "vin",
                    "year"
                ],
                "type": "object",
                "properties": {
                    "id": {
                        "type": "string"
                    },
                    "vin": {
                        "type": "string"
                    },
                    "year": {
                        "type": "integer",
                        "format": "int32"
                    },
                    "make": {
                        "type": "string"
                    },
                    "model": {
                        "type": "string"
                    },
                    "modelCode": {
                        "type": "string"
                    },
                    "manufacturerModelCode": {
                        "type": "string"
                    },
                    "modelType": {
                        "type": "string"
                    },
                    "trimDetails": {
                        "$ref": "#/components/schemas/TrimDetails"
                    },
                    "exteriorColorCode": {
                        "type": "string"
                    },
                    "exteriorColor": {
                        "type": "string"
                    },
                    "interiorColorCode": {
                        "type": "string"
                    },
                    "interiorColor": {
                        "type": "string"
                    },
                    "vehicleType": {
                        "type": "string"
                    },
                    "vehicleSubType": {
                        "type": "string"
                    },
                    "isCertified": {
                        "type": "boolean"
                    },
                    "grossWeight": {
                        "type": "integer",
                        "format": "int32"
                    },
                    "grossWeightUnit": {
                        "type": "string"
                    },
                    "unladenWeight": {
                        "type": "integer",
                        "format": "int32"
                    },
                    "unladenWeightUnit": {
                        "type": "string"
                    },
                    "mileage": {
                        "$ref": "#/components/schemas/Mileage"
                    },
                    "mileageStatus": {
                        "type": "string"
                    },
                    "license": {
                        "$ref": "#/components/schemas/License"
                    }
                },
                "example": {
                    "id": "60dd21c04cedfd0006e4e2f7",
                    "vin": "3GCUYDED89796402",
                    "year": 2022,
                    "make": "Chevrolet",
                    "model": "Silverado 1500",
                    "modelCode": "CK10543",
                    "manufacturerModelCode": "CK10543",
                    "modelType": "CREW LT 4WD",
                    "trimDetails": {
                        "trim": "LT",
                        "driveType": "Four Wheel Drive",
                        "aspiration": "Naturally Aspirated",
                        "engineSize": "5.3L",
                        "engineCylinders": 0,
                        "fuelType": "GAS",
                        "bodyType": "Crew Cab Pickup - Short Bed",
                        "axleCount": 0,
                        "bodyClass": "Truck/Van"
                    },
                    "exteriorColorCode": "GAZ",
                    "exteriorColor": "SUMMIT WHITE",
                    "interiorColorCode": "H0U",
                    "interiorColor": "JET BLACK",
                    "vehicleType": "NEW",
                    "vehicleSubType": "New Vehicle Purchase",
                    "isCertified": false,
                    "grossWeight": 7100,
                    "grossWeightUnit": "POUNDS",
                    "unladenWeight": 4920,
                    "unladenWeightUnit": "POUNDS",
                    "mileage": {
                        "unit": "MI",
                        "value": 3000
                    },
                    "mileageStatus": "ACTUAL",
                    "license": {
                        "plate": "8XB89Z",
                        "state": "CA",
                        "country": "US",
                        "expiryDate": 1629463324025
                    }
                }
            },
            "TrimDetails": {
                "title": "TrimDetails",
                "required": [
                    "aspiration",
                    "axleCount",
                    "bodyClass",
                    "bodyType",
                    "customBodyType",
                    "driveType",
                    "engineCylinders",
                    "engineDescription",
                    "engineSize",
                    "fuelDeliveryType",
                    "fuelType",
                    "marketClassCategory",
                    "transmissionControlType",
                    "trim"
                ],
                "type": "object",
                "properties": {
                    "trim": {
                        "type": "string"
                    },
                    "customBodyType": {
                        "type": "string"
                    },
                    "driveType": {
                        "type": "string"
                    },
                    "aspiration": {
                        "type": "string"
                    },
                    "engineDescription": {
                        "type": "string"
                    },
                    "engineSize": {
                        "type": "string"
                    },
                    "engineCylinders": {
                        "type": "integer",
                        "format": "int32"
                    },
                    "fuelType": {
                        "type": "string"
                    },
                    "fuelDeliveryType": {
                        "type": "string"
                    },
                    "transmissionControlType": {
                        "type": "string"
                    },
                    "bodyType": {
                        "type": "string"
                    },
                    "axleCount": {
                        "type": "integer",
                        "format": "int32"
                    },
                    "marketClassCategory": {
                        "type": "string"
                    },
                    "bodyClass": {
                        "type": "string"
                    }
                },
                "example": {
                    "trim": "LT",
                    "driveType": "Four Wheel Drive",
                    "aspiration": "Naturally Aspirated",
                    "engineSize": "5.3L",
                    "engineCylinders": 0,
                    "fuelType": "GAS",
                    "bodyType": "Crew Cab Pickup - Short Bed",
                    "axleCount": 0,
                    "bodyClass": "Truck/Van"
                }
            },
            "Mileage": {
                "title": "Mileage",
                "required": [
                    "unit",
                    "value"
                ],
                "type": "object",
                "properties": {
                    "unit": {
                        "type": "string"
                    },
                    "value": {
                        "type": "integer",
                        "format": "int32"
                    }
                },
                "example": {
                    "unit": "MI",
                    "value": 3000
                }
            },
            "License": {
                "title": "License",
                "required": [
                    "country",
                    "expiryDate",
                    "plate",
                    "state"
                ],
                "type": "object",
                "properties": {
                    "plate": {
                        "type": "string"
                    },
                    "state": {
                        "type": "string"
                    },
                    "country": {
                        "type": "string"
                    },
                    "expiryDate": {
                        "type": "integer",
                        "format": "int64"
                    }
                },
                "example": {
                    "plate": "8XB89Z",
                    "state": "CA",
                    "country": "US",
                    "expiryDate": 1629463324025
                }
            },
            "Address": {
                "title": "Address",
                "required": [
                    "city",
                    "country",
                    "county",
                    "isCurrent",
                    "line1",
                    "line2",
                    "state",
                    "zip"
                ],
                "type": "object",
                "properties": {
                    "isCurrent": {
                        "type": "boolean"
                    },
                    "line1": {
                        "type": "string"
                    },
                    "line2": {
                        "type": "string"
                    },
                    "city": {
                        "type": "string"
                    },
                    "state": {
                        "type": "string"
                    },
                    "country": {
                        "type": "string"
                    },
                    "zip": {
                        "type": "string"
                    },
                    "county": {
                        "type": "string"
                    }
                },
                "example": {
                    "isCurrent": true,
                    "line1": "914 Beach Park Blvd",
                    "line2": "APT 21",
                    "city": "Foster City",
                    "state": "CA",
                    "country": "USA",
                    "zip": "70429"
                }
            },
            "CustomerUpdateResponse": {
                "type": "object",
                "description": "Customer Update",
                "example": {
                    "id": "7d789cb6-2887-4144-ac16-420d7ea00e08",
                    "arcId": "DN55119",
                    "customerType": "BUSINESS",
                    "firstName": "Dhoni",
                    "lastName": "Mahendra",
                    "companyName": "M&D",
                    "status": "ACTIVE",
                    "phones": [
                        {
                            "phoneType": "HOME",
                            "number": "0008926073",
                            "isPrimary": false
                        },
                        {
                            "phoneType": "MOBILE",
                            "number": "0007795964",
                            "isPrimary": true
                        },
                        {
                            "phoneType": "WORK",
                            "number": "0007795962",
                            "isPrimary": true
                        }
                    ],
                    "preferredContactType": "EMAIL",
                    "email": "mandd.company@nodomain.com",
                    "communicationPreferences": {
                        "email": {
                            "isOptInService": false,
                            "isOptInMarketing": false
                        },
                        "call": {
                            "isOptInService": false,
                            "isOptInMarketing": false
                        },
                        "text": {
                            "isOptInService": false,
                            "isOptInMarketing": false
                        },
                        "mail": {
                            "isOptInService": false,
                            "isOptInMarketing": false
                        }
                    },
                    "vehicles": [
                        {
                            "id": "60dd21c04cedfd0006e4e2f7",
                            "vin": "3GCUYDED89796402",
                            "year": 2022,
                            "make": "Chevrolet",
                            "model": "Silverado 1500",
                            "modelCode": "CK10543",
                            "manufacturerModelCode": "CK10543",
                            "modelType": "CREW LT 4WD",
                            "trimDetails": {
                                "trim": "LT",
                                "driveType": "Four Wheel Drive",
                                "aspiration": "Naturally Aspirated",
                                "engineSize": "5.3L",
                                "engineCylinders": 0,
                                "fuelType": "GAS",
                                "bodyType": "Crew Cab Pickup - Short Bed",
                                "axleCount": 0,
                                "bodyClass": "Truck/Van"
                            },
                            "exteriorColorCode": "GAZ",
                            "exteriorColor": "SUMMIT WHITE",
                            "interiorColorCode": "H0U",
                            "interiorColor": "JET BLACK",
                            "vehicleType": "NEW",
                            "vehicleSubType": "New Vehicle Purchase",
                            "isCertified": false,
                            "grossWeight": 7100,
                            "grossWeightUnit": "POUNDS",
                            "unladenWeight": 4920,
                            "unladenWeightUnit": "POUNDS",
                            "mileage": {
                                "unit": "MI",
                                "value": 3000
                            },
                            "mileageStatus": "ACTUAL",
                            "license": {
                                "plate": "8XB89Z",
                                "state": "CA",
                                "country": "US",
                                "expiryDate": 1629463324025
                            }
                        }
                    ],
                    "addresses": [
                        {
                            "isCurrent": true,
                            "line1": "914 Beach Park Blvd",
                            "line2": "APT 21",
                            "city": "Foster City",
                            "state": "CA",
                            "country": "USA",
                            "zip": "70429"
                        }
                    ]
                }
            },
            "CustomerUpdateRequest": {
                "title": "CustomerUpdateRequest",
                "required": [
                    "addresses",
                    "arcId",
                    "communicationPreferences",
                    "companyName",
                    "customerType",
                    "email",
                    "firstName",
                    "lastName",
                    "middleName",
                    "phones",
                    "preferredCommunicationMode",
                    "preferredContactType",
                    "status",
                    "vehicles"
                ],
                "type": "object",
                "properties": {
                    "arcId": {
                        "type": "string"
                    },
                    "customerType": {
                        "type": "string"
                    },
                    "firstName": {
                        "type": "string"
                    },
                    "middleName": {
                        "type": "string"
                    },
                    "lastName": {
                        "type": "string"
                    },
                    "companyName": {
                        "type": "string"
                    },
                    "status": {
                        "type": "string"
                    },
                    "phones": {
                        "type": "array",
                        "items": {
                            "$ref": "#/components/schemas/Phone"
                        }
                    },
                    "preferredContactType": {
                        "type": "string"
                    },
                    "preferredCommunicationMode": {
                        "type": "string"
                    },
                    "email": {
                        "type": "string"
                    },
                    "communicationPreferences": {
                        "$ref": "#/components/schemas/CommunicationPreferences"
                    },
                    "vehicles": {
                        "type": "array",
                        "items": {
                            "$ref": "#/components/schemas/Vehicle"
                        }
                    },
                    "addresses": {
                        "type": "array",
                        "items": {
                            "$ref": "#/components/schemas/Address"
                        }
                    }
                },
                "example": {
                    "arcId": "DN55119",
                    "customerType": "BUSINESS",
                    "firstName": "Dhoni",
                    "lastName": "Mahendra",
                    "companyName": "M&D",
                    "status": "ACTIVE",
                    "phones": [
                        {
                            "phoneType": "HOME",
                            "number": "0008926073",
                            "isPrimary": false
                        },
                        {
                            "phoneType": "MOBILE",
                            "number": "0007795964",
                            "isPrimary": true
                        },
                        {
                            "phoneType": "WORK",
                            "number": "0007795962",
                            "isPrimary": true
                        }
                    ],
                    "preferredContactType": "EMAIL",
                    "email": "mandd.company@nodomain.com",
                    "communicationPreferences": {
                        "email": {
                            "isOptInService": false,
                            "isOptInMarketing": false
                        },
                        "call": {
                            "isOptInService": false,
                            "isOptInMarketing": false
                        },
                        "text": {
                            "isOptInService": false,
                            "isOptInMarketing": false
                        },
                        "mail": {
                            "isOptInService": false,
                            "isOptInMarketing": false
                        }
                    },
                    "vehicles": [
                        {
                            "id": "60dd21c04cedfd0006e4e2f7",
                            "vin": "3GCUYDED89796402",
                            "year": 2022,
                            "make": "Chevrolet",
                            "model": "Silverado 1500",
                            "modelCode": "CK10543",
                            "manufacturerModelCode": "CK10543",
                            "modelType": "CREW LT 4WD",
                            "trimDetails": {
                                "trim": "LT",
                                "driveType": "Four Wheel Drive",
                                "aspiration": "Naturally Aspirated",
                                "engineSize": "5.3L",
                                "engineCylinders": 0,
                                "fuelType": "GAS",
                                "bodyType": "Crew Cab Pickup - Short Bed",
                                "axleCount": 0,
                                "bodyClass": "Truck/Van"
                            },
                            "exteriorColorCode": "GAZ",
                            "exteriorColor": "SUMMIT WHITE",
                            "interiorColorCode": "H0U",
                            "interiorColor": "JET BLACK",
                            "vehicleType": "NEW",
                            "vehicleSubType": "New Vehicle Purchase",
                            "isCertified": false,
                            "grossWeight": 7100,
                            "grossWeightUnit": "POUNDS",
                            "unladenWeight": 4920,
                            "unladenWeightUnit": "POUNDS",
                            "mileage": {
                                "unit": "MI",
                                "value": 3000
                            },
                            "mileageStatus": "ACTUAL",
                            "license": {
                                "plate": "8XB89Z",
                                "state": "CA",
                                "country": "US",
                                "expiryDate": 1629463324025
                            }
                        }
                    ],
                    "addresses": [
                        {
                            "isCurrent": true,
                            "line1": "914 Beach Park Blvd",
                            "line2": "APT 21",
                            "city": "Foster City",
                            "state": "CA",
                            "country": "USA",
                            "zip": "70429"
                        }
                    ]
                }
            },
            "ErrorBadRequest": {
                "type": "array",
                "description": "Bad Request Error response",
                "example": [
                    {
                        "code": 400,
                        "message": "Bad Request"
                    }
                ],
                "items": {
                    "required": [
                        "code",
                        "message"
                    ],
                    "type": "object",
                    "properties": {
                        "code": {
                            "type": "integer",
                            "description": "The error code"
                        },
                        "message": {
                            "type": "string",
                            "description": "The error message"
                        }
                    }
                }
            },
            "ErrorUnauthorized": {
                "type": "array",
                "description": "Unauthorized Error response",
                "example": [
                    {
                        "code": 401,
                        "message": "Unauthorized"
                    }
                ],
                "items": {
                    "required": [
                        "code",
                        "message"
                    ],
                    "type": "object",
                    "properties": {
                        "code": {
                            "type": "integer",
                            "description": "The error code"
                        },
                        "message": {
                            "type": "string",
                            "description": "The error message"
                        }
                    }
                }
            },
            "ErrorForbidden": {
                "type": "array",
                "description": "Frobidden Error response",
                "example": [
                    {
                        "code": 403,
                        "message": "Forbidden"
                    }
                ],
                "items": {
                    "required": [
                        "code",
                        "message"
                    ],
                    "type": "object",
                    "properties": {
                        "code": {
                            "type": "integer",
                            "description": "The error code"
                        },
                        "message": {
                            "type": "string",
                            "description": "The error message"
                        }
                    }
                }
            },
            "ErrorNotFound": {
                "type": "array",
                "description": "Not found Error response",
                "example": [
                    {
                        "code": 404,
                        "message": "Not found"
                    }
                ],
                "items": {
                    "required": [
                        "code",
                        "message"
                    ],
                    "type": "object",
                    "properties": {
                        "code": {
                            "type": "integer",
                            "description": "The error code"
                        },
                        "message": {
                            "type": "string",
                            "description": "The error message"
                        }
                    }
                }
            },
            "VehicleSearchResponse": {
                "type": "object",
                "description": "Vehicle search",
                "example": {
                    "id": "301b672f-f1ed-4096-a81a-38294b7fa478",
                    "vin": "5NPET46C59H465850",
                    "year": "2009",
                    "make": "Hyundai",
                    "model": "Sonata",
                    "trim": "GLS",
                    "color": "Navy Blue",
                    "inServiceDate": 1627887600000,
                    "license": {
                        "plate": null,
                        "state": null,
                        "country": "US"
                    },
                    "customers": [
                        {
                            "id": "337040",
                            "arcId": "337040",
                            "firstName": "Ashu",
                            "lastName": "Arora",
                            "isOwner": false
                        },
                        {
                            "id": "337008",
                            "arcId": "337008",
                            "firstName": "leela",
                            "lastName": "krishna35",
                            "isOwner": false
                        },
                        {
                            "id": "0ddb7987-4458-4ec7-ae07-560f7c972de0",
                            "arcId": "338021",
                            "firstName": "nikkies",
                            "lastName": "Steve",
                            "isOwner": false
                        },
                        {
                            "id": "16a4dd90-409e-4f8d-b3c7-b8e0aae135e7",
                            "arcId": "338796",
                            "firstName": "Roshan",
                            "lastName": "automation test",
                            "isOwner": false
                        },
                        {
                            "id": "106d78f1-a9a0-46dc-a5af-f155504ec7ec",
                            "arcId": "341079",
                            "firstName": "Maximo",
                            "lastName": "Wuckert",
                            "isOwner": false
                        },
                        {
                            "id": "5c16c0dd-1d82-422d-a720-7e6e6437893b",
                            "isOwner": true
                        },
                        {
                            "id": "08d48258-440d-45bf-8495-d6138c5a0df4",
                            "arcId": "343319",
                            "firstName": "Ashu",
                            "lastName": "Arora",
                            "isOwner": false
                        }
                    ]
                }
            },
            "VehicleGetResponse": {
                "type": "object",
                "description": "Vehicle Get",
                "example": {
                    "id": "301b672f-f1ed-4096-a81a-38294b7fa478",
                    "vin": "5NPET46C59H465850",
                    "year": 2009,
                    "make": "Hyundai",
                    "model": "Sonata",
                    "isCustomVehicle": false,
                    "trim": "GLS",
                    "driveType": "FWD"
                }
            },
            "AppointmentSearchResponse": {
                "type": "object",
                "description": "Appointment search",
                "example": {
                    "id": "c3ac67b8-e0ec-4902-8570-0597a0242657",
                    "number": "61323093e828860006b07478",
                    "shopId": "ce525f0c-4bc8-40fb-8751-ffc125d0e28e",
                    "transportationTypeId": "99dc9525-3984-42fa-9ab3-15cca53d6b07",
                    "serviceAdvisorId": "25060eb0-49be-4666-a43e-63ba20fa6ce8",
                    "appointmentDateTime": 1631210400000,
                    "customer": {
                        "id": "b714d295-f952-45b4-ad8a-49299683c1ba",
                        "arcId": "b714d295-f952-45b4-ad8a-49299683c1ba",
                        "customerType": "INDIVIDUAL",
                        "firstName": "TEST",
                        "middleName": null,
                        "lastName": "DFX4",
                        "companyName": null,
                        "status": "ACTIVE",
                        "phones": [],
                        "preferredContactType": "CALL",
                        "preferredCommunicationMode": null,
                        "email": "dfx.testing@test.com",
                        "communicationPreferences": null
                    },
                    "vehicle": {
                        "id": "3ea28d65-64e2-4d28-8193-0386d374fcad",
                        "vin": "1NXBU4EE2AZ376603",
                        "year": "2010",
                        "make": "Toyota",
                        "model": "Corolla",
                        "color": null,
                        "trim": "Base",
                        "inServiceDate": null,
                        "license": {
                            "plate": null,
                            "state": null,
                            "country": null
                        }
                    },
                    "deliveryContactSameAsCustomer": true,
                    "deliveryContact": {
                        "id": "b714d295-f952-45b4-ad8a-49299683c1ba",
                        "arcId": null,
                        "customerType": "INDIVIDUAL",
                        "firstName": "TEST",
                        "middleName": null,
                        "lastName": "DFX4",
                        "companyName": null,
                        "status": "ACTIVE",
                        "phones": [],
                        "preferredContactType": "CALL",
                        "preferredCommunicationMode": null,
                        "email": "dfx.testing@test.com",
                        "communicationPreferences": null
                    },
                    "jobs": [
                        {
                            "id": "61323093e8288600062873ff",
                            "type": "DEFAULT",
                            "operations": [
                                {
                                    "id": "61323093e828860006287400",
                                    "opcode": "MINOR",
                                    "source": "OPCODE_MANAGEMENT",
                                    "laborAmount": {
                                        "amount": 0.3,
                                        "currency": "USD"
                                    },
                                    "maxPartsSaleAmount": {
                                        "amount": 0.19,
                                        "currency": "USD"
                                    }
                                }
                            ]
                        }
                    ],
                    "notifyCustomer": false,
                    "customerComments": null,
                    "postTaxTotalAmount": {
                        "amount": 0.53,
                        "currency": "USD"
                    }
                }
            },
            "AppointmentCreateRequest": {
                "title": "AppointmentCreateRequest",
                "required": [
                    "appointmentDateTime",
                    "customer",
                    "customerComments",
                    "deliveryContact",
                    "deliveryContactSameAsCustomer",
                    "jobs",
                    "notifyCustomer",
                    "postTaxTotalAmount",
                    "serviceAdvisorId",
                    "shopId",
                    "transportationTypeId",
                    "vehicle"
                ],
                "type": "object",
                "properties": {
                    "shopId": {
                        "type": "string"
                    },
                    "transportationTypeId": {
                        "type": "string"
                    },
                    "serviceAdvisorId": {
                        "type": "string"
                    },
                    "appointmentDateTime": {
                        "type": "integer",
                        "format": "int64"
                    },
                    "customer": {
                        "$ref": "#/components/schemas/Customer"
                    },
                    "vehicle": {
                        "$ref": "#/components/schemas/Vehicle2"
                    },
                    "deliveryContactSameAsCustomer": {
                        "type": "boolean"
                    },
                    "deliveryContact": {
                        "$ref": "#/components/schemas/DeliveryContact"
                    },
                    "jobs": {
                        "type": "array",
                        "items": {
                            "$ref": "#/components/schemas/Job"
                        }
                    },
                    "notifyCustomer": {
                        "type": "boolean"
                    },
                    "customerComments": {
                        "type": "string"
                    },
                    "postTaxTotalAmount": {
                        "$ref": "#/components/schemas/PostTaxTotalAmount"
                    }
                },
                "example": {
                    "shopId": "81ec1dad-ad15-40c8-b04c-1b7faa246266",
                    "transportationTypeId": "15b96e0b-6079-41a1-9c9c-fa7db48680b0",
                    "serviceAdvisorId": "TEK00",
                    "appointmentDateTime": 1631707200000,
                    "customer": {
                        "id": "da6be9c6-e525-4184-a277-af0ec228d326",
                        "arcId": "DN55007",
                        "customerType": "INDIVIDUAL",
                        "firstName": "Ashu",
                        "lastName": "Arora",
                        "companyName": "",
                        "status": "ACTIVE",
                        "phones": [
                            {
                                "phoneType": "HOME",
                                "number": "0008926073",
                                "isPrimary": false
                            },
                            {
                                "phoneType": "MOBILE",
                                "number": "0007795962",
                                "isPrimary": true
                            },
                            {
                                "phoneType": "WORK",
                                "number": "0007795962",
                                "isPrimary": true
                            }
                        ],
                        "preferredContactType": "EMAIL",
                        "email": "saint.ashu@nodomain.com"
                    },
                    "vehicle": {
                        "id": "da6be9c6-e525-4184-a277-af0ec228d326",
                        "vin": "3GTU2NEC7HG502779",
                        "year": "2017",
                        "make": "GMC",
                        "model": "Serra 1500",
                        "color": "White",
                        "trim": "SLT",
                        "inServiceDate": "",
                        "license": {
                            "plate": "8XB89Z",
                            "state": "CA",
                            "country": "US"
                        }
                    },
                    "deliveryContactSameAsCustomer": true,
                    "deliveryContact": {
                        "id": "da6be9c6-e525-4184-a277-af0ec228d326",
                        "arcId": "DN55007",
                        "customerType": "INDIVIDUAL",
                        "firstName": "Ashu",
                        "lastName": "Arora",
                        "companyName": "",
                        "status": "ACTIVE",
                        "phones": [
                            {
                                "phoneType": "HOME",
                                "number": "0008926073",
                                "isPrimary": false
                            },
                            {
                                "phoneType": "MOBILE",
                                "number": "0007795962",
                                "isPrimary": true
                            },
                            {
                                "phoneType": "WORK",
                                "number": "0007795962",
                                "isPrimary": true
                            }
                        ],
                        "preferredContactType": "EMAIL",
                        "email": "saint.ashu@nodomain.com"
                    },
                    "jobs": [
                        {
                            "type": "DEFAULT",
                            "operations": [
                                {
                                    "opcode": "MINOR",
                                    "concern": "concern",
                                    "source": "OPCODE_MANAGEMENT",
                                    "laborAmount": {
                                        "amount": 10,
                                        "currency": "USD"
                                    },
                                    "maxPartsSaleAmount": {
                                        "amount": 231,
                                        "currency": "USD"
                                    }
                                }
                            ]
                        }
                    ],
                    "notifyCustomer": false,
                    "customerComments": "Some customer comments",
                    "postTaxTotalAmount": {
                        "amount": 1200,
                        "currency": "USD"
                    }
                }
            },
            "AppointmentCreateResponse": {
                "type": "object",
                "description": "Appointment create",
                "example": {
                    "id": "c3ac67b8-e0ec-4902-8570-0597a0242657",
                    "number": "61323093e828860006b07478",
                    "shopId": "ce525f0c-4bc8-40fb-8751-ffc125d0e28e",
                    "transportationTypeId": "99dc9525-3984-42fa-9ab3-15cca53d6b07",
                    "serviceAdvisorId": "25060eb0-49be-4666-a43e-63ba20fa6ce8",
                    "appointmentDateTime": 1631210400000,
                    "customer": {
                        "id": "b714d295-f952-45b4-ad8a-49299683c1ba",
                        "arcId": "b714d295-f952-45b4-ad8a-49299683c1ba",
                        "customerType": "INDIVIDUAL",
                        "firstName": "TEST",
                        "middleName": null,
                        "lastName": "DFX4",
                        "companyName": null,
                        "status": "ACTIVE",
                        "phones": [],
                        "preferredContactType": "CALL",
                        "preferredCommunicationMode": null,
                        "email": "dfx.testing@test.com",
                        "communicationPreferences": null
                    },
                    "vehicle": {
                        "id": "3ea28d65-64e2-4d28-8193-0386d374fcad",
                        "vin": "1NXBU4EE2AZ376603",
                        "year": "2010",
                        "make": "Toyota",
                        "model": "Corolla",
                        "color": null,
                        "trim": "Base",
                        "inServiceDate": null,
                        "license": {
                            "plate": null,
                            "state": null,
                            "country": null
                        }
                    },
                    "deliveryContactSameAsCustomer": true,
                    "deliveryContact": {
                        "id": "b714d295-f952-45b4-ad8a-49299683c1ba",
                        "arcId": null,
                        "customerType": "INDIVIDUAL",
                        "firstName": "TEST",
                        "middleName": null,
                        "lastName": "DFX4",
                        "companyName": null,
                        "status": "ACTIVE",
                        "phones": [],
                        "preferredContactType": "CALL",
                        "preferredCommunicationMode": null,
                        "email": "dfx.testing@test.com",
                        "communicationPreferences": null
                    },
                    "jobs": [
                        {
                            "id": "61323093e8288600062873ff",
                            "type": "DEFAULT",
                            "operations": [
                                {
                                    "id": "61323093e828860006287400",
                                    "opcode": "MINOR",
                                    "source": "OPCODE_MANAGEMENT",
                                    "laborAmount": {
                                        "amount": 0.3,
                                        "currency": "USD"
                                    },
                                    "maxPartsSaleAmount": {
                                        "amount": 0.19,
                                        "currency": "USD"
                                    }
                                }
                            ]
                        }
                    ],
                    "notifyCustomer": false,
                    "customerComments": null,
                    "postTaxTotalAmount": {
                        "amount": 0.53,
                        "currency": "USD"
                    }
                }
            },
            "AppointmentUpdateRequest": {
                "title": "AppointmentUpdateRequest",
                "required": [
                    "appointmentDateTime",
                    "customer",
                    "customerComments",
                    "deliveryContact",
                    "deliveryContactSameAsCustomer",
                    "jobs",
                    "notifyCustomer",
                    "postTaxTotalAmount",
                    "serviceAdvisorId",
                    "shopId",
                    "transportationTypeId",
                    "vehicle"
                ],
                "type": "object",
                "properties": {
                    "shopId": {
                        "type": "string"
                    },
                    "transportationTypeId": {
                        "type": "string"
                    },
                    "serviceAdvisorId": {
                        "type": "string"
                    },
                    "appointmentDateTime": {
                        "type": "integer",
                        "format": "int64"
                    },
                    "customer": {
                        "$ref": "#/components/schemas/Customer"
                    },
                    "vehicle": {
                        "$ref": "#/components/schemas/Vehicle2"
                    },
                    "deliveryContactSameAsCustomer": {
                        "type": "boolean"
                    },
                    "deliveryContact": {
                        "$ref": "#/components/schemas/DeliveryContact"
                    },
                    "jobs": {
                        "type": "array",
                        "items": {
                            "$ref": "#/components/schemas/Job"
                        }
                    },
                    "notifyCustomer": {
                        "type": "boolean"
                    },
                    "customerComments": {
                        "type": "string"
                    },
                    "postTaxTotalAmount": {
                        "$ref": "#/components/schemas/PostTaxTotalAmount"
                    }
                },
                "example": {
                    "id": "f2c31e1e-5921-4890-adae-1578d734efbf",
                    "shopId": "81ec1dad-ad15-40c8-b04c-1b7faa246266",
                    "transportationTypeId": "15b96e0b-6079-41a1-9c9c-fa7db48680b0",
                    "serviceAdvisorId": "TEK00",
                    "appointmentDateTime": 1631707200000,
                    "customer": {
                        "id": "da6be9c6-e525-4184-a277-af0ec228d326",
                        "arcId": "DN55007",
                        "customerType": "INDIVIDUAL",
                        "firstName": "Ashu",
                        "lastName": "Arora",
                        "companyName": "",
                        "status": "ACTIVE",
                        "phones": [
                            {
                                "phoneType": "HOME",
                                "number": "0008926073",
                                "isPrimary": false
                            },
                            {
                                "phoneType": "MOBILE",
                                "number": "0007795962",
                                "isPrimary": true
                            },
                            {
                                "phoneType": "WORK",
                                "number": "0007795962",
                                "isPrimary": true
                            }
                        ],
                        "preferredContactType": "EMAIL",
                        "email": "saint.ashu@nodomain.com"
                    },
                    "vehicle": {
                        "id": "da6be9c6-e525-4184-a277-af0ec228d326",
                        "vin": "3GTU2NEC7HG502779",
                        "year": "2017",
                        "make": "GMC",
                        "model": "Serra 1500",
                        "color": "White",
                        "trim": "SLT",
                        "inServiceDate": "",
                        "license": {
                            "plate": "8XB89Z",
                            "state": "CA",
                            "country": "US"
                        }
                    },
                    "deliveryContactSameAsCustomer": true,
                    "deliveryContact": {
                        "id": "da6be9c6-e525-4184-a277-af0ec228d326",
                        "arcId": "DN55007",
                        "customerType": "INDIVIDUAL",
                        "firstName": "Ashu",
                        "lastName": "Arora",
                        "companyName": "",
                        "status": "ACTIVE",
                        "phones": [
                            {
                                "phoneType": "HOME",
                                "number": "0008926073",
                                "isPrimary": false
                            },
                            {
                                "phoneType": "MOBILE",
                                "number": "0007795962",
                                "isPrimary": true
                            },
                            {
                                "phoneType": "WORK",
                                "number": "0007795962",
                                "isPrimary": true
                            }
                        ],
                        "preferredContactType": "EMAIL",
                        "email": "saint.ashu@nodomain.com"
                    },
                    "jobs": [
                        {
                            "type": "DEFAULT",
                            "operations": [
                                {
                                    "opcode": "MINOR",
                                    "concern": "concern",
                                    "source": "OPCODE_MANAGEMENT",
                                    "laborAmount": {
                                        "amount": 10,
                                        "currency": "USD"
                                    },
                                    "maxPartsSaleAmount": {
                                        "amount": 231,
                                        "currency": "USD"
                                    }
                                }
                            ]
                        }
                    ],
                    "notifyCustomer": false,
                    "customerComments": "Some customer comments",
                    "postTaxTotalAmount": {
                        "amount": 1200,
                        "currency": "USD"
                    }
                }
            },
            "Customer": {
                "title": "Customer",
                "required": [
                    "arcId",
                    "companyName",
                    "customerType",
                    "email",
                    "firstName",
                    "id",
                    "lastName",
                    "middleName",
                    "phones",
                    "preferredCommunicationMode",
                    "preferredContactType",
                    "status"
                ],
                "type": "object",
                "properties": {
                    "id": {
                        "type": "string"
                    },
                    "arcId": {
                        "type": "string"
                    },
                    "customerType": {
                        "type": "string"
                    },
                    "firstName": {
                        "type": "string"
                    },
                    "middleName": {
                        "type": "string"
                    },
                    "lastName": {
                        "type": "string"
                    },
                    "companyName": {
                        "type": "string"
                    },
                    "status": {
                        "type": "string"
                    },
                    "phones": {
                        "type": "array",
                        "items": {
                            "$ref": "#/components/schemas/Phone"
                        }
                    },
                    "preferredContactType": {
                        "type": "string"
                    },
                    "preferredCommunicationMode": {
                        "type": "string"
                    },
                    "email": {
                        "type": "string"
                    }
                },
                "example": {
                    "id": "da6be9c6-e525-4184-a277-af0ec228d326",
                    "arcId": "DN55007",
                    "customerType": "INDIVIDUAL",
                    "firstName": "Ashu",
                    "lastName": "Arora",
                    "companyName": "",
                    "status": "ACTIVE",
                    "phones": [
                        {
                            "phoneType": "HOME",
                            "number": "0008926073",
                            "isPrimary": false
                        },
                        {
                            "phoneType": "MOBILE",
                            "number": "0007795962",
                            "isPrimary": true
                        },
                        {
                            "phoneType": "WORK",
                            "number": "0007795962",
                            "isPrimary": true
                        }
                    ],
                    "preferredContactType": "EMAIL",
                    "email": "saint.ashu@nodomain.com"
                }
            },
            "Vehicle2": {
                "title": "Vehicle2",
                "required": [
                    "color",
                    "id",
                    "inServiceDate",
                    "license",
                    "make",
                    "model",
                    "trim",
                    "vin",
                    "year"
                ],
                "type": "object",
                "properties": {
                    "id": {
                        "type": "string"
                    },
                    "vin": {
                        "type": "string"
                    },
                    "year": {
                        "type": "string"
                    },
                    "make": {
                        "type": "string"
                    },
                    "model": {
                        "type": "string"
                    },
                    "color": {
                        "type": "string"
                    },
                    "trim": {
                        "type": "string"
                    },
                    "inServiceDate": {
                        "type": "string"
                    },
                    "license": {
                        "$ref": "#/components/schemas/License2"
                    }
                },
                "example": {
                    "id": "da6be9c6-e525-4184-a277-af0ec228d326",
                    "vin": "3GTU2NEC7HG502779",
                    "year": "2017",
                    "make": "GMC",
                    "model": "Serra 1500",
                    "color": "White",
                    "trim": "SLT",
                    "inServiceDate": "",
                    "license": {
                        "plate": "8XB89Z",
                        "state": "CA",
                        "country": "US"
                    }
                }
            },
            "License2": {
                "title": "License2",
                "required": [
                    "country",
                    "plate",
                    "state"
                ],
                "type": "object",
                "properties": {
                    "plate": {
                        "type": "string"
                    },
                    "state": {
                        "type": "string"
                    },
                    "country": {
                        "type": "string"
                    }
                },
                "example": {
                    "plate": "8XB89Z",
                    "state": "CA",
                    "country": "US"
                }
            },
            "DeliveryContact": {
                "title": "DeliveryContact",
                "required": [
                    "arcId",
                    "companyName",
                    "customerType",
                    "email",
                    "firstName",
                    "id",
                    "lastName",
                    "middleName",
                    "phones",
                    "preferredCommunicationMode",
                    "preferredContactType",
                    "status"
                ],
                "type": "object",
                "properties": {
                    "id": {
                        "type": "string"
                    },
                    "arcId": {
                        "type": "string"
                    },
                    "customerType": {
                        "type": "string"
                    },
                    "firstName": {
                        "type": "string"
                    },
                    "middleName": {
                        "type": "string"
                    },
                    "lastName": {
                        "type": "string"
                    },
                    "companyName": {
                        "type": "string"
                    },
                    "status": {
                        "type": "string"
                    },
                    "phones": {
                        "type": "array",
                        "items": {
                            "$ref": "#/components/schemas/Phone"
                        }
                    },
                    "preferredContactType": {
                        "type": "string"
                    },
                    "preferredCommunicationMode": {
                        "type": "string"
                    },
                    "email": {
                        "type": "string"
                    }
                },
                "example": {
                    "id": "da6be9c6-e525-4184-a277-af0ec228d326",
                    "arcId": "DN55007",
                    "customerType": "INDIVIDUAL",
                    "firstName": "Ashu",
                    "lastName": "Arora",
                    "companyName": "",
                    "status": "ACTIVE",
                    "phones": [
                        {
                            "phoneType": "HOME",
                            "number": "0008926073",
                            "isPrimary": false
                        },
                        {
                            "phoneType": "MOBILE",
                            "number": "0007795962",
                            "isPrimary": true
                        },
                        {
                            "phoneType": "WORK",
                            "number": "0007795962",
                            "isPrimary": true
                        }
                    ],
                    "preferredContactType": "EMAIL",
                    "email": "saint.ashu@nodomain.com"
                }
            },
            "Job": {
                "title": "Job",
                "required": [
                    "operations",
                    "type"
                ],
                "type": "object",
                "properties": {
                    "type": {
                        "type": "string"
                    },
                    "operations": {
                        "type": "array",
                        "items": {
                            "$ref": "#/components/schemas/Operation"
                        }
                    }
                },
                "example": {
                    "type": "DEFAULT",
                    "operations": [
                        {
                            "opcode": "MINOR",
                            "concern": "concern",
                            "source": "OPCODE_MANAGEMENT",
                            "laborAmount": {
                                "amount": 10,
                                "currency": "USD"
                            },
                            "maxPartsSaleAmount": {
                                "amount": 231,
                                "currency": "USD"
                            }
                        }
                    ]
                }
            },
            "Operation": {
                "title": "Operation",
                "required": [
                    "concern",
                    "laborAmount",
                    "maxPartsSaleAmount",
                    "opcode",
                    "source"
                ],
                "type": "object",
                "properties": {
                    "opcode": {
                        "type": "string"
                    },
                    "concern": {
                        "type": "string"
                    },
                    "source": {
                        "type": "string"
                    },
                    "laborAmount": {
                        "$ref": "#/components/schemas/LaborAmount"
                    },
                    "maxPartsSaleAmount": {
                        "$ref": "#/components/schemas/MaxPartsSaleAmount"
                    }
                },
                "example": {
                    "opcode": "MINOR",
                    "concern": "concern",
                    "source": "OPCODE_MANAGEMENT",
                    "laborAmount": {
                        "amount": 10,
                        "currency": "USD"
                    },
                    "maxPartsSaleAmount": {
                        "amount": 231,
                        "currency": "USD"
                    }
                }
            },
            "LaborAmount": {
                "title": "LaborAmount",
                "required": [
                    "amount",
                    "currency"
                ],
                "type": "object",
                "properties": {
                    "amount": {
                        "type": "number",
                        "format": "double"
                    },
                    "currency": {
                        "type": "string"
                    }
                },
                "example": {
                    "amount": 10,
                    "currency": "USD"
                }
            },
            "MaxPartsSaleAmount": {
                "title": "MaxPartsSaleAmount",
                "required": [
                    "amount",
                    "currency"
                ],
                "type": "object",
                "properties": {
                    "amount": {
                        "type": "number",
                        "format": "double"
                    },
                    "currency": {
                        "type": "string"
                    }
                },
                "example": {
                    "amount": 231,
                    "currency": "USD"
                }
            },
            "PostTaxTotalAmount": {
                "title": "PostTaxTotalAmount",
                "required": [
                    "amount",
                    "currency"
                ],
                "type": "object",
                "properties": {
                    "amount": {
                        "type": "number",
                        "format": "double"
                    },
                    "currency": {
                        "type": "string"
                    }
                },
                "example": {
                    "amount": 1200,
                    "currency": "USD"
                }
            },
            "Job1": {
                "title": "Job1",
                "required": [
                    "concern",
                    "concernType",
                    "jobType",
                    "operations"
                ],
                "type": "object",
                "properties": {
                    "concern": {
                        "type": "string"
                    },
                    "concernType": {
                        "type": "string"
                    },
                    "jobType": {
                        "type": "string"
                    },
                    "operations": {
                        "type": "array",
                        "items": {
                            "$ref": "#/components/schemas/Operation1"
                        }
                    }
                },
                "example": {
                    "concern": "4 WHEEL ALIGNMENT",
                    "concernType": "NONE",
                    "jobType": "DEFAULT",
                    "operations": [
                        {
                            "storyLines": [
                                {
                                    "text": "story line 1",
                                    "source": "USER"
                                }
                            ],
                            "opcode": "4ALIGN",
                            "payType": "CUSTOMER_PAY",
                            "source": "OPCODE_MANAGEMENT",
                            "laborAmount": {
                                "amount": 10,
                                "currency": "USD"
                            },
                            "maxPartsSaleAmount": {
                                "amount": 231,
                                "currency": "USD"
                            }
                        }
                    ]
                }
            },
            "Operation1": {
                "title": "Operation1",
                "required": [
                    "laborAmount",
                    "maxPartsSaleAmount",
                    "opcode",
                    "payType",
                    "source",
                    "storyLines"
                ],
                "type": "object",
                "properties": {
                    "storyLines": {
                        "type": "array",
                        "items": {
                            "$ref": "#/components/schemas/StoryLine"
                        }
                    },
                    "opcode": {
                        "type": "string"
                    },
                    "payType": {
                        "type": "string"
                    },
                    "source": {
                        "type": "string"
                    },
                    "laborAmount": {
                        "$ref": "#/components/schemas/LaborAmount1"
                    },
                    "maxPartsSaleAmount": {
                        "$ref": "#/components/schemas/MaxPartsSaleAmount1"
                    }
                },
                "example": {
                    "storyLines": [
                        {
                            "text": "story line 1",
                            "source": "USER"
                        }
                    ],
                    "opcode": "4ALIGN",
                    "payType": "CUSTOMER_PAY",
                    "source": "OPCODE_MANAGEMENT",
                    "laborAmount": {
                        "amount": 10,
                        "currency": "USD"
                    },
                    "maxPartsSaleAmount": {
                        "amount": 231,
                        "currency": "USD"
                    }
                }
            },
            "StoryLine": {
                "title": "StoryLine",
                "required": [
                    "source",
                    "text"
                ],
                "type": "object",
                "properties": {
                    "text": {
                        "type": "string"
                    },
                    "source": {
                        "type": "string"
                    }
                },
                "example": {
                    "text": "story line 1",
                    "source": "USER"
                }
            },
            "LaborAmount1": {
                "title": "LaborAmount1",
                "required": [
                    "amount",
                    "currency"
                ],
                "type": "object",
                "properties": {
                    "amount": {
                        "type": "integer",
                        "format": "int32"
                    },
                    "currency": {
                        "type": "string"
                    }
                },
                "example": {
                    "amount": 10,
                    "currency": "USD"
                }
            },
            "MaxPartsSaleAmount1": {
                "title": "MaxPartsSaleAmount1",
                "required": [
                    "amount",
                    "currency"
                ],
                "type": "object",
                "properties": {
                    "amount": {
                        "type": "integer",
                        "format": "int32"
                    },
                    "currency": {
                        "type": "string"
                    }
                },
                "example": {
                    "amount": 231,
                    "currency": "USD"
                }
            },
            "Customer1": {
                "title": "Customer1",
                "required": [
                    "addresses",
                    "companyName",
                    "customerType",
                    "email",
                    "firstName",
                    "id",
                    "lastName",
                    "phones",
                    "primaryPhone"
                ],
                "type": "object",
                "properties": {
                    "id": {
                        "type": "string"
                    },
                    "firstName": {
                        "type": "string"
                    },
                    "lastName": {
                        "type": "string"
                    },
                    "email": {
                        "type": "string"
                    },
                    "primaryPhone": {
                        "type": "string"
                    },
                    "companyName": {
                        "type": "string"
                    },
                    "addresses": {
                        "type": "array",
                        "items": {
                            "$ref": "#/components/schemas/Address2"
                        }
                    },
                    "phones": {
                        "type": "array",
                        "items": {
                            "$ref": "#/components/schemas/Phone"
                        }
                    },
                    "customerType": {
                        "type": "string"
                    }
                },
                "example": {
                    "id": "7aa7b583-bfb4-4402-8d41-e50bb30309f7",
                    "firstName": "Vivek",
                    "lastName": "test",
                    "email": "vivektest@mailinator.com",
                    "primaryPhone": "1732498343",
                    "addresses": [
                        {
                            "isCurrent": true,
                            "line1": "914 Beach Park Blvd",
                            "line2": "APT 21",
                            "city": "Foster City",
                            "state": "CA",
                            "country": "USA",
                            "zip": "70429",
                            "addressType": "BILLING_ ADDRESS"
                        }
                    ],
                    "phones": [
                        {
                            "phoneType": "MOBILE",
                            "number": "1732498343",
                            "isPrimary": true
                        }
                    ],
                    "customerType": "INDIVIDUAL"
                }
            },
            "Address2": {
                "title": "Address2",
                "required": [
                    "addressType",
                    "city",
                    "country",
                    "county",
                    "isCurrent",
                    "line1",
                    "line2",
                    "state",
                    "zip"
                ],
                "type": "object",
                "properties": {
                    "isCurrent": {
                        "type": "boolean"
                    },
                    "line1": {
                        "type": "string"
                    },
                    "line2": {
                        "type": "string"
                    },
                    "city": {
                        "type": "string"
                    },
                    "state": {
                        "type": "string"
                    },
                    "country": {
                        "type": "string"
                    },
                    "zip": {
                        "type": "string"
                    },
                    "county": {
                        "type": "string"
                    },
                    "addressType": {
                        "type": "string"
                    }
                },
                "example": {
                    "isCurrent": true,
                    "line1": "914 Beach Park Blvd",
                    "line2": "APT 21",
                    "city": "Foster City",
                    "state": "CA",
                    "country": "USA",
                    "zip": "70429",
                    "addressType": "BILLING_ ADDRESS"
                }
            },
            "Vehicle3": {
                "title": "Vehicle3",
                "required": [
                    "color",
                    "id",
                    "inServiceDate",
                    "license",
                    "make",
                    "model",
                    "trim",
                    "vin",
                    "year"
                ],
                "type": "object",
                "properties": {
                    "id": {
                        "type": "string"
                    },
                    "vin": {
                        "type": "string"
                    },
                    "year": {
                        "type": "string"
                    },
                    "make": {
                        "type": "string"
                    },
                    "model": {
                        "type": "string"
                    },
                    "color": {
                        "type": "string"
                    },
                    "trim": {
                        "type": "string"
                    },
                    "inServiceDate": {
                        "type": "integer",
                        "format": "int64"
                    },
                    "license": {
                        "$ref": "#/components/schemas/License2"
                    }
                },
                "example": {
                    "id": "da6be9c6-e525-4184-a277-af0ec228d326",
                    "vin": "3GTU2NEC7HG502779",
                    "year": "2017",
                    "make": "GMC",
                    "model": "Serra 1500",
                    "color": "White",
                    "trim": "SLT",
                    "inServiceDate": 1627586673000,
                    "license": {
                        "plate": "8XB89Z",
                        "state": "CA",
                        "country": "US"
                    }
                }
            },
            "AppointmentUpdateResponse": {
                "type": "object",
                "description": "Appointment update",
                "example": {
                    "id": "c3ac67b8-e0ec-4902-8570-0597a0242657",
                    "number": "61323093e828860006b07478",
                    "shopId": "ce525f0c-4bc8-40fb-8751-ffc125d0e28e",
                    "transportationTypeId": "99dc9525-3984-42fa-9ab3-15cca53d6b07",
                    "serviceAdvisorId": "25060eb0-49be-4666-a43e-63ba20fa6ce8",
                    "appointmentDateTime": 1631210400000,
                    "customer": {
                        "id": "b714d295-f952-45b4-ad8a-49299683c1ba",
                        "arcId": "b714d295-f952-45b4-ad8a-49299683c1ba",
                        "customerType": "INDIVIDUAL",
                        "firstName": "TEST",
                        "middleName": null,
                        "lastName": "DFX4",
                        "companyName": null,
                        "status": "ACTIVE",
                        "phones": [],
                        "preferredContactType": "CALL",
                        "preferredCommunicationMode": null,
                        "email": "dfx.testing@test.com",
                        "communicationPreferences": null
                    },
                    "vehicle": {
                        "id": "3ea28d65-64e2-4d28-8193-0386d374fcad",
                        "vin": "1NXBU4EE2AZ376603",
                        "year": "2010",
                        "make": "Toyota",
                        "model": "Corolla",
                        "color": null,
                        "trim": "Base",
                        "inServiceDate": null,
                        "license": {
                            "plate": null,
                            "state": null,
                            "country": null
                        }
                    },
                    "deliveryContactSameAsCustomer": true,
                    "deliveryContact": {
                        "id": "b714d295-f952-45b4-ad8a-49299683c1ba",
                        "arcId": null,
                        "customerType": "INDIVIDUAL",
                        "firstName": "TEST",
                        "middleName": null,
                        "lastName": "DFX4",
                        "companyName": null,
                        "status": "ACTIVE",
                        "phones": [],
                        "preferredContactType": "CALL",
                        "preferredCommunicationMode": null,
                        "email": "dfx.testing@test.com",
                        "communicationPreferences": null
                    },
                    "jobs": [
                        {
                            "id": "61323093e8288600062873ff",
                            "type": "DEFAULT",
                            "operations": [
                                {
                                    "id": "61323093e828860006287400",
                                    "opcode": "MINOR",
                                    "source": "OPCODE_MANAGEMENT",
                                    "laborAmount": {
                                        "amount": 0.3,
                                        "currency": "USD"
                                    },
                                    "maxPartsSaleAmount": {
                                        "amount": 0.19,
                                        "currency": "USD"
                                    }
                                }
                            ]
                        }
                    ],
                    "notifyCustomer": false,
                    "customerComments": null,
                    "postTaxTotalAmount": {
                        "amount": 0.53,
                        "currency": "USD"
                    }
                }
            },
            "RepairOrderSearchResponse": {
                "type": "object",
                "description": "RepairOrder search",
                "example": {
                    "id": "6155c8c277490b00067689ae",
                    "number": "0201540",
                    "createdTime": 1633011894073,
                    "modifiedTime": 1633077988717,
                    "isDeleted": false,
                    "lastStatus": null,
                    "tagNumber": "MK89",
                    "type": "QUICK",
                    "status": "UNASSIGNED",
                    "appointmentId": null,
                    "appointmentNumber": null,
                    "transportType": "SELF",
                    "departmentId": "5cc01212cff47e0008c2cbf5",
                    "teamId": "5f848f9ad8192b0008e6f40c",
                    "isHold": false,
                    "holdReason": null,
                    "holdTime": null,
                    "unHoldTime": null,
                    "unHoldBy": null,
                    "priority": 0,
                    "calculatedPriority": 0,
                    "isPriorityOverridden": false,
                    "checkinTime": 1633011894073,
                    "promiseTime": 1633109598370,
                    "coupons": {},
                    "customer": {
                        "id": "7dd223b7-876b-4ece-8da5-3ccd48b08387",
                        "arcId": "339430",
                        "firstName": "Nirosha",
                        "lastName": "N",
                        "companyName": null,
                        "phones": [
                            {
                                "phoneType": "HOME",
                                "number": "",
                                "isPrimary": null
                            },
                            {
                                "phoneType": "MOBILE",
                                "number": "9253656354",
                                "isPrimary": true
                            },
                            {
                                "phoneType": "WORK",
                                "number": "",
                                "isPrimary": null
                            }
                        ],
                        "preferredContactType": 0,
                        "preferredCommunicationMode": null,
                        "email": "nnirosha@tekion.com",
                        "communicationPreferences": {
                            "email": {
                                "isOptInService": false,
                                "isOptInMarketing": false
                            },
                            "call": {
                                "isOptInService": false,
                                "isOptInMarketing": false
                            },
                            "text": {
                                "isOptInService": false,
                                "isOptInMarketing": false
                            },
                            "mail": {
                                "isOptInService": false,
                                "isOptInMarketing": false
                            }
                        },
                        "addresses": [
                            {
                                "isCurrent": true,
                                "line1": "7667 W West 95th Street",
                                "line2": null,
                                "city": "Hickory Hills",
                                "state": "IL",
                                "country": "US",
                                "zip": "60457",
                                "county": "Cook"
                            }
                        ]
                    },
                    "dropOffCustomer": {
                        "id": "7dd223b7-876b-4ece-8da5-3ccd48b08387",
                        "arcId": "339430",
                        "firstName": "Nirosha",
                        "lastName": "N",
                        "companyName": null,
                        "phones": [
                            {
                                "phoneType": "HOME",
                                "number": "",
                                "isPrimary": null
                            },
                            {
                                "phoneType": "MOBILE",
                                "number": "9253656354",
                                "isPrimary": true
                            },
                            {
                                "phoneType": "WORK",
                                "number": "",
                                "isPrimary": null
                            }
                        ],
                        "preferredContactType": 0,
                        "preferredCommunicationMode": null,
                        "email": "nnirosha@tekion.com",
                        "communicationPreferences": {
                            "email": {
                                "isOptInService": false,
                                "isOptInMarketing": false
                            },
                            "call": {
                                "isOptInService": false,
                                "isOptInMarketing": false
                            },
                            "text": {
                                "isOptInService": false,
                                "isOptInMarketing": false
                            },
                            "mail": {
                                "isOptInService": false,
                                "isOptInMarketing": false
                            }
                        },
                        "addresses": [
                            {
                                "isCurrent": true,
                                "line1": "7667 W West 95th Street",
                                "line2": null,
                                "city": "Hickory Hills",
                                "state": "IL",
                                "country": "US",
                                "zip": "60457",
                                "county": "Cook"
                            }
                        ]
                    },
                    "billingCustomer": {
                        "id": "7dd223b7-876b-4ece-8da5-3ccd48b08387",
                        "arcId": "339430",
                        "firstName": "Nirosha",
                        "lastName": "N",
                        "companyName": null,
                        "phones": [
                            {
                                "phoneType": "HOME",
                                "number": "",
                                "isPrimary": null
                            },
                            {
                                "phoneType": "MOBILE",
                                "number": "9253656354",
                                "isPrimary": true
                            },
                            {
                                "phoneType": "WORK",
                                "number": "",
                                "isPrimary": null
                            }
                        ],
                        "preferredContactType": 0,
                        "preferredCommunicationMode": null,
                        "email": "nnirosha@tekion.com",
                        "communicationPreferences": {
                            "email": {
                                "isOptInService": false,
                                "isOptInMarketing": false
                            },
                            "call": {
                                "isOptInService": false,
                                "isOptInMarketing": false
                            },
                            "text": {
                                "isOptInService": false,
                                "isOptInMarketing": false
                            },
                            "mail": {
                                "isOptInService": false,
                                "isOptInMarketing": false
                            }
                        },
                        "addresses": [
                            {
                                "isCurrent": true,
                                "line1": "7667 W West 95th Street",
                                "line2": null,
                                "city": "Hickory Hills",
                                "state": "IL",
                                "country": "US",
                                "zip": "60457",
                                "county": "Cook"
                            }
                        ]
                    },
                    "vehicle": {
                        "id": "b1793b69-9869-11ea-8000-000000000000",
                        "vin": "3GNAXJEV9JL104010",
                        "year": "2018",
                        "make": "Chevrolet",
                        "model": "Equinox",
                        "rfId": null,
                        "stockType": null,
                        "trimDetails": {
                            "trim": "LT",
                            "driveType": "FWD",
                            "bodyType": "Sport Utility",
                            "bodyClass": null
                        },
                        "mileageIn": 12,
                        "mileageOut": 0
                    },
                    "reopenReason": null,
                    "reopenedBy": null,
                    "reopenedTime": null,
                    "voidReason": null,
                    "voidedBy": null,
                    "voidedTime": null,
                    "declinedBy": null,
                    "declinedReason": null,
                    "declinedTime": null,
                    "invoice": {
                        "invoiceAmount": {}
                    },
                    "jobs": []
                }
            },
            "TransportationResponse": {
                "type": "object",
                "description": "Transportation",
                "example": {
                    "id": "dc39aa8a-ce26-4981-ae9d-38f310dec0dd",
                    "name": "RENTAL",
                    "status": "ACTIVE"
                }
            },
            "ServiceShopResponse": {
                "type": "object",
                "description": "ServiceShop",
                "example": {
                    "id": "b7801399-9ec6-4e77-a3de-b3f0640b9dc0",
                    "name": "Team A",
                    "status": "ACTIVE",
                    "isDefault": false
                }
            }
        }
    }
}
