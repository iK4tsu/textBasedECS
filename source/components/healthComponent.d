module components.healthComponent;

import components.component;
import entities.entity;
import components.componentType;


class HealthComponent : Component
{
	private int curHp;
	private int maxHp;


	public this(int curHp, int maxHp)
	{
		super(HEALTH);
		setCurHp(curHp);
		setMaxHp(maxHp);
	}


	public void setCurHp(int curHp) { this.curHp = curHp; }
	public void setMaxHp(int maxHp) { this.maxHp = maxHp; }

	public int getCurHp() { return this.curHp; }
	public int getMaxHp() { return this.maxHp; }
}