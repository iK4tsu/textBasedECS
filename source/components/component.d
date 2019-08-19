module components.component;

import entities.entity;
import components.componentType;

class Component
{
	protected bool active;
	protected Entity entity;
	protected const ComponentType type;


	public this(ComponentType _type)
	{
		type = _type;
		turnOn;
	}

	public void setEntity(Entity _entity)
	{
		if (entity is null)
		{
			entity = _entity;
			_entity.addComponent(this);
		}
	}

	public Entity getEntity() { return this.entity; }

	public ComponentType getType() { return type; }

	public void turnOn() { active = true; }
	public void turnOff() { active = false; }

	public bool isActive() { return active; }
}