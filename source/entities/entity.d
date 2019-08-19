module entities.entity;

import components.component;
import systems.system;
import game;
import entities.entityType;
import components.inventoryComponent;
import components.componentType;
import systems.systemType;

import std.algorithm : cmp, canFind, remove;

class Entity
{
	protected Component[ComponentType] components;
	protected System[SystemType] systems;
	protected Game game;
	protected EntityType[] types;
	protected string name;

	public this(Component[] components, EntityType[] _types) { this(components, _types, "no name"); }
	public this(Component[] components, EntityType[] _types, string _name)
	{
		addComponent(components);
		addTypes(_types);
		setName(_name);
	}

	public void update()
	{
		
	}

	public void addComponent(Component _component)
	{
		if (_component.getType !in components)
		{
			components[_component.getType] = _component;
			_component.setEntity(this);
		}
	}

	public void addComponent(Component[] _components)
	{
		foreach(_component; _components)
		{
			addComponent(_component);
		}
	}

	public void removeComponent(ComponentType _type)
	{
		if (_type in components)
			components.remove(_type);
	}

	public void turnOffComponent(ComponentType _type)
	{
		if (_type in components)
			components[_type].turnOff;
	}

	public void turnOnComponent(ComponentType _type)
	{
		if (_type in components)
			components[_type].turnOn;
	}

	public Component getComponent(ComponentType _type)
	{
		if (_type in components)
			return components[_type];
		else
			return null;
	}

	public void addSystem(System _system)
	{
		if (_system.getType !in systems)
		{
			systems[_system.getType] = _system;
			_system.addEntity(this);
		}
	}

	public void addSystem(System[] _systems)
	{
		foreach(_system; _systems)
		{
			addSystem(_system);
		}
	}

	public void removeSystem(SystemType _type)
	{
		if (_type in systems)
			systems.remove(_type);
	}

	public System getSystem(SystemType _type)
	{
		if (_type in systems)
			return systems[_type];
		else
			return null;
	}

	public void setGame(Game _game) { game = _game; }
	public Game getGame() { return game; }

	public void setName(const string _name) { name = _name; }
	public const string getName() { return name; }


	public void addTypes(EntityType[] _types)
	{
		foreach(_type; _types)
		{
			if (!canFind(types, _type))
				types ~= _type;
		}
	}

	public EntityType[] getTypes()
	{
		EntityType[] ret;
		foreach(_type; types)
		{
			ret ~= _type;
		}
		return ret;
	}
}