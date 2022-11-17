#include "Person.h"
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
  std::thread
      m_dataProcessThread; // TODO：对象初始化时绑定指定函数，能后台持续执行，且线程的状态能被外部变量所影响
  std::thread
      m_sendMessageThread; // TODO：对象初始化时绑定指定函数，能后台持续执行，且线程的状态能被外部变量所影响

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
};