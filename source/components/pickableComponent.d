module components.pickableComponent;

import components.component;
import components.componentType;


class PickableComponent : Component
{
	private bool pickable;

	public this()
	{
		super(PICKABLE);
	}
}