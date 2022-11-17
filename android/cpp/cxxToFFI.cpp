#include "cxxToFFI.h"
#include <string>

Cxx *cxx = Cxx::getInstance(); // 单列模式

void setPersonName(char *name) {
  std::string tempName = name;
  cxx->setName(tempName);
}

char *getPersonName() {
  std::string *tempName = cxx->getName();
  return (char *)tempName->c_str();
}

void setPersonAge(int age) { cxx->setAge(person->age); }

int getPersonAge() { return cxx->getAge(); }

void setPersonWeight(double weight) { cxx->setWeight(person->weight); }

double getPersonWeight() { return cxx->getWeight(); }

void setPersonHeight(double height) { cxx->setHeight(person->height); }

double getPersonHeight() { return cxx->getHeight(); }

void setFlag() { cxx->setFlag(); }

bool getFlag() { return cxx->getFlag(); }