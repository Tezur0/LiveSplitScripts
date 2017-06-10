state("SeriousSam")
{
    float isNotLoading : "Engine.dll", 0x1E0668;
}

isLoading
{
    return current.isNotLoading==0;
}