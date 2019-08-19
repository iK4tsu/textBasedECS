module entities.bread;

import entities.entity;
import entities.entityType;

class Bread : Entity
{
	public this ()
	{
		super(null, [FOOD], "bread");
	}
}