module entities.food;

import entities.entity;
import entities.entityType;

class Food : Entity
{
	public this (string _name)
	{
		super(FOOD, _name);
	}
}