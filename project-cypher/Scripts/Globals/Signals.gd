extends Node
# This is where you write global signals

# Signal used to turn off power-ups
signal turnOff
# Signal used to start the projectile spawner
signal startStorm
# Signal used to start the barrier
signal activateBarrier
# Signal used to start the clones
signal activateClone
# Signal used to start enemy storm
signal enemyStorm
# Signal used to keep progress of dash bar
signal dashProgress(time: float)
# Signal used to update progress of dash bar
signal dashCooldownProgress(time: float)
