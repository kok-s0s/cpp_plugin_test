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
  m_flag = true;

  m_sendMessageThread = new std::thread(&Cxx::sendMessageThreadManager, this);
}

Cxx::~Cxx() {}

#pragma region Person Interface

void Cxx::setName(std::string name) { m_person->setName(name); }

std::string *Cxx::getName() { return m_person->getName(); }

void Cxx::setAge(int age) { m_person->setAge(age); }

int Cxx::getAge() { return m_person->getAge(); }

void Cxx::setWeight(double weight) { m_person->setWeight(weight); }

double Cxx::getWeight() { return m_person->getWeight(); }

void Cxx::setHeight(double height) { m_person->setHeight(height); }

double Cxx::getHeight() { return m_person->getHeight(); }

#pragma endregion

#pragma region Thread Control

void Cxx::setFlag() { m_flag = !m_flag; }

bool Cxx::getFlag() { return m_flag; }

void Cxx::sendMessageThreadManager() {
  while (1) {
    int i = 0;
    while (m_flag) {
      switch (i % 4) {
      case 0:
        m_stack.push(m_sendMessage->add());
        break;
      case 1:
        m_stack.push(m_sendMessage->subtract());
        break;
      case 2:
        m_stack.push(m_sendMessage->multiply());
        break;
      case 3:
        m_stack.push(m_sendMessage->divide());
        break;

      default:
        break;
      }

      i++;
      if (i > 10000000) {
        i = 0;
      }
      std::this_thread::sleep_for(std::chrono::seconds(3));
    }
    while (!m_flag) {
      std::this_thread::sleep_for(std::chrono::milliseconds(1000));
    }
  }
}

void Cxx::dataProcessThreadManager() {
  while (1) {
    while (m_flag) {
      // do_something()
    }
    while (!m_flag) {
      std::this_thread::sleep_for(std::chrono::milliseconds(1000));
    }
  }
}

#pragma endregion