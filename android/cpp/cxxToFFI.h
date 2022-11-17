#include "cxx.h"
#include <iostream>

extern "C" {

void setPersonName(char *name);

char *getPersonName();

void setPersonAge(int age);

int getPersonAge();

void setPersonWeight(double weight);

double getPersonWeight();

void setPersonHeight(double height);

double getPersonHeight();

void setFlag();

bool getFlag();
}