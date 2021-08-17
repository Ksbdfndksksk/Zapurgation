import flixel.FlxG;

class Ratings
{
    public static function GenerateLetterRank(accuracy:Float) // generate a letter ranking
    {
        var ranking:String = "N/A";
		if(FlxG.save.data.botplay)
			ranking = "BotPlay";

        if (PlayState.misses == 0 && PlayState.bads == 0 && PlayState.shits == 0 && PlayState.goods == 0) // Marvelous (SICK) Full Combo
            ranking = "(MFC)";
        else if (PlayState.misses == 0 && PlayState.bads == 0 && PlayState.shits == 0 && PlayState.goods >= 1) // Good Full Combo (Nothing but Goods & Sicks)
            ranking = "(GFC)";
        else if (PlayState.misses == 0) // Regular FC
            ranking = "(FC)";
        else if (PlayState.misses < 10) // Single Digit Combo Breaks
            ranking = "(SDCB)";
        else
            ranking = "(Clear)";

        // WIFE TIME :)))) (based on Wife3)

        var wifeConditions:Array<Bool> = [
            accuracy >= 99, // AAAAA
            accuracy >= 97.5, // AAAA:
            accuracy >= 95, // AAAA.
            accuracy >= 94, // AAAA
            accuracy >= 93, // AAA:
            accuracy >= 92, // AAA.
            accuracy >= 91, // AAA
            accuracy >= 90, // AA:
            accuracy >= 80, // AA.
            accuracy >= 70, // AA
            accuracy >= 60, // A:
            accuracy >= 50, // A.
            accuracy >= 40, // A
            accuracy >= 30, // B
            accuracy >= 20, // C
            accuracy < 10 // D
        ];

        for(i in 0...wifeConditions.length)
        {
            var b = wifeConditions[i];
            if (b)
            {
                switch(i)
                {
                    case 0:
                        ranking += " ALEK";
                    case 1:
                        ranking += " ZOIO";
                    case 2:
                        ranking += " PERFEITO";
                    case 3:
                        ranking += " Quase Perfeito";
                    case 4:
                        ranking += " Excelente";
                    case 5:
                        ranking += " Incrível";
                    case 6:
                        ranking += " Muito Bom";
                    case 7:
                        ranking += " Maravilhoso";
                    case 8:
                        ranking += " Legal";
                    case 9:
                        ranking += " Bom";
                    case 10:
                        ranking += " Bonzin";
                    case 11:
                        ranking += " Razoavel";
                    case 12:
                        ranking += " Meh";
                    case 13:
                        ranking += " Aceitável";
                    case 14:
                        ranking += " Meh";
                    case 15:
                        ranking += " OVO PEGA A MARRETA!";
                }
                break;
            }
        }

        if (accuracy == 0)
            ranking = "N/A";
		else if(FlxG.save.data.botplay)
			ranking = "BotPlay";

        return ranking;
    }
    
    public static function CalculateRating(noteDiff:Float, ?customSafeZone:Float):String // Generate a judgement through some timing shit
    {

        var customTimeScale = Conductor.timeScale;

        if (customSafeZone != null)
            customTimeScale = customSafeZone / 166;

        // trace(customTimeScale + ' vs ' + Conductor.timeScale);

        // I HATE THIS IF CONDITION
        // IF LEMON SEES THIS I'M SORRY :(

        // trace('Hit Info\nDifference: ' + noteDiff + '\nZone: ' + Conductor.safeZoneOffset * 1.5 + "\nTS: " + customTimeScale + "\nLate: " + 155 * customTimeScale);
	    
        if (noteDiff > 166 * customTimeScale) // so god damn early its a miss
            return "miss";
        if (noteDiff > 135 * customTimeScale) // way early
            return "shit";
        else if (noteDiff > 90 * customTimeScale) // early
            return "bad";
        else if (noteDiff > 45 * customTimeScale) // your kinda there
            return "good";
        else if (noteDiff < -45 * customTimeScale) // little late
            return "good";
        else if (noteDiff < -90 * customTimeScale) // late
            return "bad";
        else if (noteDiff < -135 * customTimeScale) // late as fuck
            return "shit";
        else if (noteDiff < -166 * customTimeScale) // so god damn late its a miss
            return "miss";
        return "sick";
    }

    public static function CalculateRanking(score:Int,scoreDef:Int,nps:Int,accuracy:Float):String
    {
        return 
        (FlxG.save.data.npsDisplay ? "NPS: " + nps + (!FlxG.save.data.botplay ? " | " : "") : "") + (!FlxG.save.data.botplay ?	// NPS Toggle
        "Pontuação:" + (Conductor.safeFrames != 10 ? score + " (" + scoreDef + ")" : "" + score) + 									// Score
        " | Erros:" + PlayState.misses + 																				// Misses/Combo Breaks
        " | Precisão:" + (FlxG.save.data.botplay ? "N/A" : HelperFunctions.truncateFloat(accuracy, 2) + " %") +  				// Accuracy
        " | " + GenerateLetterRank(accuracy) : ""); 																			// Letter Rank
    }
}
