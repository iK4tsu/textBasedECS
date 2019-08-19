module systems.inventorySystem;

import components.component;
import components.inventoryComponent;
import systems.system;
import entities.entity;
import entities.entityType;
import systems.systemType;
import components.componentType;


import std.algorithm : count, countUntil, canFind;
import std.conv      : to;

class InventorySystem : System
{
	private InventoryComponent inventory;

	public this()
	{
		super(INVENTORY_S);
	}

	override public void update()
	{
		foreach(_entity; entities)
		{
			InventoryComponent inventory = to!(InventoryComponent)(_entity.getComponent(INVENTORY));

			if (inventory.isActive)
			{

			}
		}
	}
}