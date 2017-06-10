state("SeriousSam")
{
	float isNotLoading : "Engine.dll", 0x2134A8;
}

isLoading
{
    return current.isNotLoading==0;
}