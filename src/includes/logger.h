#ifndef SDAIA_LOGGER_H_
#define SDAIA_LOGGER_H_

#include <kore/kore.h>
#include <kore/http.h>

void log_http_req(int, char *, int);
void log_node_debug(char *, char *);
void log_node_error(char *, char *);

#endif
