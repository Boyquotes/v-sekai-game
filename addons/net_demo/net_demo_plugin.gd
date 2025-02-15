# res://addons/net_demo/net_demo_plugin.gd
# This file is part of the V-Sekai Game.
# https://github.com/V-Sekai/v-sekai-game
#
# Copyright (c) 2018-2022 SaracenOne
# Copyright (c) 2019-2022 K. S. Ernest (iFire) Lee (fire)
# Copyright (c) 2020-2022 Lyuma
# Copyright (c) 2020-2022 MMMaellon
# Copyright (c) 2022 V-Sekai Contributors
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

@tool
extends EditorPlugin

var editor_interface: EditorInterface = null


func _init():
	print("Initialising Net Demo plugin")


func _enter_tree():
	editor_interface = get_editor_interface()
	add_autoload_singleton("GameManager", "res://net_demo/core/game_manager.gd")
	add_autoload_singleton(
		"MultiplayerPhysicsOwnershipTracker", "res://net_demo/core/entity/multiplayer_physics_ownership_tracker.gd"
	)


func _notification(p_notification: int):
	match p_notification:
		NOTIFICATION_PREDELETE:
			print("Destroying NetDemo plugin")


func _get_plugin_name() -> String:
	return "NetDemoPlugin"


func _exit_tree() -> void:
	remove_autoload_singleton("GameManager")
	remove_autoload_singleton("MultiplayerPhysicsOwnershipTracker")
