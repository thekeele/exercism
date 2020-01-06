#include "string.h"
#include "two_fer.h"

void two_fer(char* response, char* name)
{
  response[0] = '\0';

  strcat(response, "One for ");

  if (name == NULL) strcat(response, "you");
  else strcat(response, name);

  strcat(response, ", one for me.");
}
