module room;

import entities.entity;
import components.inventoryComponent;
import entities.entityType;
import components.componentType;


import std.algorithm : cmp, remove;
import std.conv      : to;

class Room : Entity
{
	public this(string _name)
	{ 
		super(null, [ROOM], _name);
	}

	public InventoryComponent getInventory() { return to!(InventoryComponent)(getComponent(INVENTORY)); }
}


unittest
{
	Room shelter = new Room("shelter");
	InventoryComponent shelterInv = new InventoryComponent(2);

	shelter.addComponent(shelterInv);

	assert(shelter.getInventory == shelterInv);
	assert(shelterInv.getEntity == shelter);
}