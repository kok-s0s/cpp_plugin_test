#include <iostream>
#include "cxx.h"

extern "C"
{
  typedef struct {
    char * name;
    int age;
    double weight;
    double height;
  } Person;

  Person *init();

  void setPersonName(char *name);

  char *getPersonName();

  void setPersonAge(int age);

  int getPersonAge();

  void setPersonWeight(double weight);

  double getPersonWeight();

  void setPersonHeight(double height);

  double getPersonHeight();
}