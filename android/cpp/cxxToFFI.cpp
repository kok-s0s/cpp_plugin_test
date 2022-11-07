#include "cxxToFFI.h"
#include <string>

Cxx * cxx = Cxx::getInstance();
auto *person = (Person *) new Person;

Person *init()
{
  std::string* tempName = cxx->getName();
  person->name = (char*)tempName->c_str();
  person->age = cxx->getAge();
  person->weight = cxx->getWeight();
  person->height = cxx->getHeight();
  return person;
}

void setPersonName(char *name)
{
  person->name = name;
  std::string tempName = name;
  cxx->setName(tempName);
}

char *getPersonName()
{
  std::string* tempName = cxx->getName();
  return (char *)tempName->c_str();
}

void setPersonAge(int age)
{
  person->age = age;
  cxx->setAge(person->age);
}

int getPersonAge()
{
  return cxx->getAge();
}

void setPersonWeight(double weight)
{
  person->weight = weight;
  cxx->setWeight(person->weight);
}

double getPersonWeight()
{
  return cxx->getWeight();
}

void setPersonHeight(double height)
{
  person->height = height;
  cxx->setHeight(person->height);
}

double getPersonHeight()
{
  return cxx->getHeight();
}