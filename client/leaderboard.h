#define LEADERBOARD_COLOUR 0xFF, 0x00, 0x00
#define LEADERBOARD_MARGIN 0
#define LEADERBOARD_GAP 30

/**
 * @brief Structure for a leaderboard entry.
 * @param username The username to show on the leaderboard.
 * @param score The score to show on the leaderboard.
 */
struct LeaderboardEntry
{
	char username[16];
	score_t score;
};

struct LeaderboardEntry leaderboard[MAX_PLAYERS];

/**
 * @brief A comparison function for leaderboard entry structures.
 * @param a The first leaderboard entry.
 * @param b The second leaderboard entry.
 */
extern int
LeaderboardEntry_cmp(const void *a, const void *b);

/**
 * @brief Sorts the leaderboard entries and shows the leaderboard.
 */
extern void
render_leaderboard(void);