#include "Cxx.h"

Cxx *Cxx::m_self = nullptr;

Cxx *Cxx::getInstance() {
  if (m_self == nullptr) {
    m_self = new Cxx();
  }
  return m_self;
}

Cxx::Cxx() {
  m_person = new Person();
  m_flag = false;
}

Cxx::~Cxx() {}

void Cxx::setName(std::string name) { m_person->setName(name); }

std::string *Cxx::getName() { return m_person->getName(); }

void Cxx::setAge(int age) { m_person->setAge(age); }

int Cxx::getAge() { return m_person->getAge(); }

void Cxx::setWeight(double weight) { m_person->setWeight(weight); }

double Cxx::getWeight() { return m_person->getWeight(); }

void Cxx::setHeight(double height) { m_person->setHeight(height); }

double Cxx::getHeight() { return m_person->getHeight(); }

void Cxx::setFlag() { m_flag = !m_flag; }

bool Cxx::getFlag() { return m_flag; }