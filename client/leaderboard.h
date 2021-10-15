#define LEADERBOARD_COLOUR 0xFF, 0x00, 0x00
#define LEADERBOARD_MARGIN 0
#define LEADERBOARD_GAP 30

struct LeaderboardEntry
{
	char username[16];
	score_t score;
};

struct LeaderboardEntry leaderboard[MAX_PLAYERS];

int
LeaderboardEntry_cmp(const void *a, const void *b)
{
	return ((struct LeaderboardEntry *) b)->score
		- ((struct LeaderboardEntry *) a)->score;
}

void
render_leaderboard(void)
{
	char leaderboard_line[32];

	strncpy(leaderboard[0].username, player.username, player.username_size);
	leaderboard[0].username[player.username_size] = '\0';
	leaderboard[0].score = player.score;

	for (size_t i = 1; i <= num_other_players; i++)
	{
		strncpy(leaderboard[i].username, other_players[i - 1].username,
			other_players[i - 1].username_size);
		leaderboard[i].username[other_players[i - 1].username_size] = '\0';
		leaderboard[i].score = other_players[i - 1].score;
	}

	qsort(leaderboard, 1 + num_other_players,
		sizeof(struct LeaderboardEntry), LeaderboardEntry_cmp);

	set_colour_rgb(LEADERBOARD_COLOUR);

	for (size_t i = 0; i <= num_other_players; i++)
	{
		sprintf(leaderboard_line, "%s - %hu",
			leaderboard[i].username, leaderboard[i].score);
		render_text_right(font_20px, leaderboard_line,
			width - LEADERBOARD_MARGIN,
			LEADERBOARD_MARGIN + i * LEADERBOARD_GAP);
	}
}