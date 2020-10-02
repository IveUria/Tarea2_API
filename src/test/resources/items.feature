Feature: Items
  @API
  Scenario: As a user I want to create a ITems
    Given I have authentication to todo.ly
    # creando el item
    When I send POST request 'api/items.json' with json
    """
    {
       "Content":"Primer Item"
    }
    """
    # verificar el response
    Then I expected the response code 200
    And I expected the response body is equal
    """
    {
    "Id": "EXCLUDE",
    "Content": "Primer Item",
    "ItemType": 1,
    "Checked": false,
    "ProjectId": null,
    "ParentId": null,
    "Path": "",
    "Collapsed": false,
    "DateString": null,
    "DateStringPriority": 0,
    "DueDate": "",
    "Recurrence": null,
    "ItemOrder": null,
    "Priority": 4,
    "LastSyncedDateTime": "EXCLUDE",
    "Children": [],
    "DueDateTime": null,
    "CreatedDate": "EXCLUDE",
    "LastCheckedDate": null,
    "LastUpdatedDate": "EXCLUDE",
    "Deleted": false,
    "Notes": "",
    "InHistory": false,
    "SyncClientCreationId": null,
    "DueTimeSpecified": true,
    "OwnerId": 676072
     }


    """
# modificar el item
    And I get the property value 'Id' and save on ID_ITEM
    And I get the property value 'Content' and save on NAME_ITEM

    When I send PUT request 'api/items/ID_ITEM.json' with json
    """
    {
       "Content":"NAME_ITEM UPDATE"
    }
    """
    # verificar el response
    Then I expected the response code 200
    And I expected the response body is equal
    """
    {
    "Id": "EXCLUDE",
    "Content": "NAME_ITEM UPDATE",
    "ItemType": 1,
    "Checked": false,
    "ProjectId": null,
    "ParentId": null,
    "Path": "",
    "Collapsed": false,
    "DateString": null,
    "DateStringPriority": 0,
    "DueDate": "",
    "Recurrence": null,
    "ItemOrder": null,
    "Priority": 4,
    "LastSyncedDateTime": "EXCLUDE",
    "Children": [],
    "DueDateTime": null,
    "CreatedDate": "EXCLUDE",
    "LastCheckedDate": null,
    "LastUpdatedDate": "EXCLUDE",
    "Deleted": false,
    "Notes": "",
    "InHistory": false,
    "SyncClientCreationId": null,
    "DueTimeSpecified": true,
    "OwnerId": 676072
    }
    """
    #borrado del item
    When I send DELETE request 'api/items/ID_ITEM.json' with json
    """
    """
    Then I expected the response code 200

    #obtener el item
    When I send GET request 'api/items/ID_ITEM.json' with json
    """
    """
    Then I expected the response code 200
    And I expected the response body is equal
    """
    {
    "Id": "EXCLUDE",
    "Content": "NAME_ITEM UPDATE",
    "ItemType": 1,
    "Checked": false,
    "ProjectId": null,
    "ParentId": null,
    "Path": "",
    "Collapsed": false,
    "DateString": null,
    "DateStringPriority": 0,
    "DueDate": "",
    "Recurrence": null,
    "ItemOrder": null,
    "Priority": 4,
    "LastSyncedDateTime": "EXCLUDE",
    "Children": [],
    "DueDateTime": null,
    "CreatedDate": "EXCLUDE",
    "LastCheckedDate": null,
    "LastUpdatedDate": "EXCLUDE",
    "Deleted": true,
    "Notes": "",
    "InHistory": false,
    "SyncClientCreationId": null,
    "DueTimeSpecified": true,
    "OwnerId": 676072
}
    """



