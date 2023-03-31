# chat/routing.py
"""
This code is used to route the websocket requests to the correct consumer.
It is used by the Channels routing system.
"""
from django.urls import re_path

from . import consumers

websocket_urlpatterns = [
    # path("ws/room_name>/", consumers.ChatConsumer.as_asgi()),
    re_path(r"ws/chat/(?P<room_name>\w+)/$", consumers.ChatConsumer.as_asgi()),
]
