#include <stdio.h>
#include <string.h>
#include <syslog.h>

int main(int argc, char** argv)
{
    setlogmask(LOG_UPTO(LOG_USER));
    openlog("exampleprog", LOG_CONS | LOG_PID | LOG_NDELAY, LOG_LOCAL1);
    if (argc < 2) {
        syslog(LOG_ERR, "invalid argument count , usage is ./writer <path to file> <string to write");
        return 1;
    }
    char* filename = argv[1];
    char* string = argv[2];

    FILE* fptr;

    // Open a file in writing mode
    fptr = fopen(filename, "w");
    if (NULL == fptr) {
        syslog(LOG_ERR, "Unable to open the file");
        return 1;
    }
    // Write some text to the file
    fprintf(fptr, string);
    syslog(LOG_DEBUG, "Writing %s to file %s", string, filename);

    // Close the file
    fclose(fptr);

    return 0;
}