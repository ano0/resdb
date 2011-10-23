/*
 * Modified libpurple nullclient.c from http://pidgin.sourcearchive.com.
 * This libpurple program serves no other purpose other than testing
 * for a successfull login.
 */

#include "purple.h"
#include <glib.h>
#include <signal.h>
#include <string.h>
#include <unistd.h>
#include <stdio.h>
#define CUSTOM_USER_DIRECTORY  "/dev/null"
#define CUSTOM_PLUGIN_PATH     ""
#define PLUGIN_SAVE_PREF       "/purple/user/plugins/saved"
#define UI_ID                  "user"
#define PURPLE_GLIB_READ_COND  (G_IO_IN | G_IO_HUP | G_IO_ERR)
#define PURPLE_GLIB_WRITE_COND (G_IO_OUT | G_IO_HUP | G_IO_ERR | G_IO_NVAL)

typedef struct _PurpleGLibIOClosure {
	PurpleInputFunction function;
	guint result;
	gpointer data;
} PurpleGLibIOClosure;


static void purple_glib_io_destroy(gpointer data)
{
	g_free(data);
}

static gboolean purple_glib_io_invoke(GIOChannel *source, GIOCondition condition, gpointer data)
{
	PurpleGLibIOClosure *closure = data;
	PurpleInputCondition purple_cond = 0;

	if (condition & PURPLE_GLIB_READ_COND)
		purple_cond |= PURPLE_INPUT_READ;
	if (condition & PURPLE_GLIB_WRITE_COND)
		purple_cond |= PURPLE_INPUT_WRITE;

	closure->function(closure->data, g_io_channel_unix_get_fd(source),
			  purple_cond);

	return TRUE;
}

static guint glib_input_add(gint fd, PurpleInputCondition condition, PurpleInputFunction function,
							   gpointer data)
{
	PurpleGLibIOClosure *closure = g_new0(PurpleGLibIOClosure, 1);
	GIOChannel *channel;
	GIOCondition cond = 0;

	closure->function = function;
	closure->data = data;

	if (condition & PURPLE_INPUT_READ)
		cond |= PURPLE_GLIB_READ_COND;
	if (condition & PURPLE_INPUT_WRITE)
		cond |= PURPLE_GLIB_WRITE_COND;

	channel = g_io_channel_unix_new(fd);
	closure->result = g_io_add_watch_full(channel, G_PRIORITY_DEFAULT, cond,
					      purple_glib_io_invoke, closure, purple_glib_io_destroy);

	g_io_channel_unref(channel);
	return closure->result;
}

static PurpleEventLoopUiOps glib_eventloops =
{
	g_timeout_add,
	g_source_remove,
	glib_input_add,
	g_source_remove,
	NULL,
#if GLIB_CHECK_VERSION(2,14,0)
	g_timeout_add_seconds,
#else
	NULL,
#endif
	NULL,
	NULL,
	NULL
};

static void network_disconnected(void)
{
	printf("This machine has been disconnected from the internet\n");
}

static void report_disconnect_reason(PurpleConnection *gc, PurpleConnectionError reason, const char *text)
{
	PurpleAccount *account = purple_connection_get_account(gc);
	printf("Connection disconnected: \"%s\" (%s)\n  >Error: %d\n  >Reason: %s\n", purple_account_get_username(account), purple_account_get_protocol_id(account), reason, text);
	abort();
}

static PurpleConnectionUiOps connection_uiops =
{
	NULL,                      /* connect_progress         */
	NULL,                      /* connected                */
	NULL,                      /* disconnected             */
	NULL,                      /* notice                   */
	NULL,                      /* report_disconnect        */
	NULL,                      /* network_connected        */
	network_disconnected,      /* network_disconnected     */
	report_disconnect_reason,  /* report_disconnect_reason */
	NULL,
	NULL,
	NULL
};

static void ui_init(void)
{
	purple_connections_set_ui_ops(&connection_uiops);
}

static PurpleCoreUiOps core_uiops =
{
	NULL,
	NULL,
	ui_init,
	NULL,

	/* padding */
	NULL,
	NULL,
	NULL,
	NULL
};

static void init_libpurple(void)
{
	purple_debug_set_enabled(FALSE);
	purple_core_set_ui_ops(&core_uiops);
	purple_eventloop_set_ui_ops(&glib_eventloops);

	if (!purple_core_init(UI_ID)) {
	fprintf(stderr,
	"libpurple initialization failed. Dumping core.\n"
	"Please report this!\n");
	abort();
	}
	purple_set_blist(purple_blist_new()); // "Unnecessary" code left here to prevent output spam.
}

static void signed_on(PurpleConnection *gc)
{
	printf("Account Connected\n");
        abort();
}

static void connect_to_signals(void)
{
	static int handle;
	purple_signal_connect(purple_connections_get_handle(), "signed-on", &handle,
	PURPLE_CALLBACK(signed_on), NULL);
}

int main(int argc, char *argv[])
{
	GMainLoop *loop = g_main_loop_new(NULL, FALSE);
	signal(SIGCHLD, SIG_IGN);
	init_libpurple();
	connect_to_signals();
	PurpleAccount *account = purple_account_new(argv[2], argv[1]);
	purple_account_set_password(account, argv[3]);
	purple_accounts_add(account);
	purple_account_set_enabled(account, UI_ID, TRUE);
	g_main_loop_run(loop);
	return 0;
}
