state("you_are_empty")
{
    bool isNotLoading : "ds2kernel.dll", 0xC00EC;
}

isLoading
{
    return !current.isNotLoading;
}