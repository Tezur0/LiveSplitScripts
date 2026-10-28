state("you_are_empty")
{
    bool loaded : "ds2kernel.dll", 0xC00EC;
    string50 map : "ds2kernel.dll", 0xBDC94;
}

startup
{
    settings.Add("levels", true, "Levels");

    vars.levelNames = new Dictionary<string, string>
    {
        {"med2", "Hospital 2"},
        {"kolhoz", "Kolhoz 1"},
        {"kolhoz_part2", "Kolhoz 2"},
        {"meat", "Plant 1"},
        {"meat_part2", "Plant 2"},
        {"wall", "Old Town"},
        {"gor", "Totalitarianism 1"},
        {"gor_part_2", "Totalitarianism 2"},
        {"grsvt", "City Council"},
        {"gorkonec", "Tram"},
        {"poh", "Yards"},
        {"kinostreet", "Cinema 1"},
        {"kinostreet2", "Cinema 2"},
        {"metro", "Metro 1"},
        {"met6", "Metro 2"},
        {"theatre", "Opera"},
        {"krovli", "Roofs"},
        {"parall", "Depot 1"},
        {"parall_part2", "Depot 2"},
        {"parall_part3", "Depot 3"},
        {"lastlevel", "Utopia"},
        {"futur", "Reactor"},
        {"lastzlo", "Finale"},
    };

    foreach (var level in vars.levelNames)
        settings.Add(level.Key, true, level.Value, "levels");
}

init
{
    vars.doneMaps = new List<string>();
}

start
{
    if (current.map == "med1" && old.map != "med1")
    {
        vars.doneMaps.Clear();
        return true;
    }
}

isLoading
{
    return !current.loaded;
}

exit
{
    timer.IsGameTimePaused = true;
}

split
{
    if (current.map == old.map || string.IsNullOrEmpty(current.map))
        return false;
    if (!vars.levelNames.ContainsKey(current.map) || !settings[current.map])
        return false;
    if (vars.doneMaps.Contains(current.map))
        return false;

    vars.doneMaps.Add(current.map);
    return true;
}

onReset
{
    vars.doneMaps.Clear();
}
