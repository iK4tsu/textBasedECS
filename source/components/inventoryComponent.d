module components.inventoryComponent;

import components.component;
import entities.entity;
import components.componentType;

import std.algorithm : canFind;

class InventoryComponent : Component
{
	private Entity[] objects;
	private uint space;
	private bool full;


	public this() { this(null, null, 0); }
	public this(Entity owner, Entity[] _objects, uint space)
	{
		super(INVENTORY);
		addObjects(_objects);
	}

	public void setObjects(Entity[] _objects) { objects = _objects; }

	public void addObjects(Entity[] _objects)
	{
		foreach(_object; _objects)
		{
			if  (!canFind(objects, _object))
			{
				objects ~= _object;
				_object.addComponent(this);
			}
		}
	}

	public void removeObject(Entity _objects)
	{

	}

	public const string[] getObjectNames()
	{
		string[] ret;
		foreach(_object; objects)
		{
			ret ~= _object.getName;
		}
		return ret;
	}

	public Entity[] getObjects()
	{
		return objects.dup;
	}
}

unittest
{
	InventoryComponent inv = new InventoryComponent(null, null, 0);

	assert(typeid(inv) == typeid(InventoryComponent));
}