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


	public this(uint _space) { this(null, _space); }
	public this(Entity[] _objects, uint _space)
	{
		super(INVENTORY);
		addObjects(_objects);
		setSpace(_space);
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

	public void setSpace(uint _space) { space = _space; }
	public uint getSpace() { return space; }
}

unittest
{
	InventoryComponent inv = new InventoryComponent(50);

	assert(inv.getSpace	== 50);
}