public class Collision { 
	boolean enemyNexusCollision(Enemies one, Nexus two) {
		float maxDistance = (one.size + two.size) / 2;

		if(abs(one.position.x - two.position.x) > maxDistance ||  
			abs(one.position.y - two.position.y) > maxDistance)
		{
			return false;
		}
		else if(dist(one.position.x, one.position.y, two.position.x, two.position.y) > maxDistance)
		{
			return false;
		}
		else
		{
			return true;
		}
	}


	boolean bulletEnemyCollision(Bullet one, Enemies two) {
		float maxDistance = (one.size + two.size) / 2;

		if(abs(one.position.x - two.position.x) > maxDistance ||  
			abs(one.position.y - two.position.y) > maxDistance)
		{
			return false;
		}
		else if(dist(one.position.x, one.position.y, two.position.x, two.position.y) > maxDistance)
		{
			return false;
		}
		else
		{
			return true;
		}
	}

	boolean bulletNexusCollision(Bullet one, Nexus two) {
		float maxDistance = (one.size + two.size) / 2;

		if(abs(one.position.x - two.position.x) > maxDistance ||  
			abs(one.position.y - two.position.y) > maxDistance)
		{
			return false;
		}
		else if(dist(one.position.x, one.position.y, two.position.x, two.position.y) > maxDistance)
		{
			return false;
		}
		else
		{
			return true;
		}
	}
}