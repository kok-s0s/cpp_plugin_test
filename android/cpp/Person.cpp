#include "Person.h"

Person::Person() {
  m_name = "su";
  m_age = 22;
  m_weight = 52;
  m_height = 166;
}

Person::~Person() {}

void Person::setName(std::string name) { m_name = name; }

std::string *Person::getName() { return &m_name; }

void Person::setAge(int age) { m_age = age; }

int Person::getAge() { return m_age; }

void Person::setWeight(double weight) { m_weight = weight; }

double Person::getWeight() { return m_weight; }

void Person::setHeight(double height) { m_height = height; }

double Person::getHeight() { return m_height; }
