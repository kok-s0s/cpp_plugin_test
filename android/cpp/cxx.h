#include "Person.h"
#include "SendMessage.h"
#include <stack>
#include <string>
#include <thread>

class Cxx {
private:
  static Cxx *m_self; // 单例模式
  Cxx(const Cxx &) = delete;
  Cxx &operator=(const Cxx &) = delete;
  Cxx();
  Person *m_person;
  bool m_flag;
  SendMessage *m_sendMessage;
  std::thread *m_sendMessageThread; // mock
  std::thread *m_dataProcessThread; // mock
  std::stack<int> m_stack;

public:
  /**
   * @brief Get the Instance object
   *
   * @return Cxx*
   */
  static Cxx *getInstance();

  /**
   * @brief Destroy the Cxx object
   *
   */
  ~Cxx();

#pragma region Person Interface

  /**
   * @brief Set the Name object
   *
   * @param name
   */
  void setName(std::string name);

  /**
   * @brief Get the Name object
   *
   * @return std::string*
   */
  std::string *getName();

  /**
   * @brief Set the Age object
   *
   * @param age
   */
  void setAge(int age);

  /**
   * @brief Get the Age object
   *
   * @return int
   */
  int getAge();

  /**
   * @brief Set the Weight object
   *
   * @param weight
   */
  void setWeight(double weight);

  /**
   * @brief Get the Weight object
   *
   * @return double
   */
  double getWeight();

  /**
   * @brief Set the Height object
   *
   * @param height
   */
  void setHeight(double height);

  /**
   * @brief Get the Height object
   *
   * @return double
   */
  double getHeight();

#pragma endregion

#pragma region Thread Control

  /**
   * @brief Set the Flag object
   *
   */
  void setFlag();

  /**
   * @brief Get the Flag object
   *
   * @return true
   * @return false
   */
  bool getFlag();

  /**
   * @brief control this thread work status
   *
   */
  void sendMessageThreadManager();

  /**
   * @brief control this thread work status
   *
   */
  void dataProcessThreadManager();

#pragma endregion
};