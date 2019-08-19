module room;

import entities.entity;
import components.inventoryComponent;
import entities.entityType;


import std.algorithm : cmp, remove;

class Room : Entity
{
	public this(string name) { super(null, [ROOM], name); }
	//public this(InventoryComponent _inventory, string name)
	//{
	//	super([_inventory], [ROOM], name);
	//}

	public void setInventory(InventoryComponent _inventory) { addComponent(_inventory); }
	//public InventoryComponent getInventory() { return get!(new InventoryComponent()); }
}


unittest
{
	import entities.bread;

	Room shelter = new Room("shelter");
	InventoryComponent shelterInv = new InventoryComponent(shelter, null, 2);

	shelter.addComponent(shelterInv);

	Bread bread = new Bread();
	shelterInv.addObjects([bread]);

	//assert(shelter.getInventory == shelterInv);
	assert(shelterInv.getEntity == shelter);
	assert(shelterInv.getObjects.length == 1);
	assert(shelterInv.getObjects[0] == bread);
}