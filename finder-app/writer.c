#include <stdio.h>
#include <syslog.h>
#include <stdlib.h>

int main(int argc, char **argv) {
	if (argc < 1) {
		syslog(LOG_ERR, "Missing writefile and writestr arguments");
		return 1;
	}
	if (argc < 2) {
		syslog(LOG_ERR, "Missing writestr arguments");
		return 1;
	}

	const char *file = argv[1];
	const char *data = argv[2];
	FILE *fptr;
	fptr = fopen(file, "w+");
	if (fptr == NULL) {
		syslog(LOG_ERR, "File cannot be created");
		return 1;
	} else {
		int ret = fputs(data, fptr);
		if (ret == 0) {
			syslog(LOG_ERR, "Failed to write to file");
			return 1;
		} else {
			syslog(LOG_DEBUG, "Writing %s to %s\n", data, file);
		}
		fclose(fptr);
	}

	return 0;
}
