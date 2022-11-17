#include <string>

class Person {
private:
  std::string m_name;
  int m_age;
  double m_weight;
  double m_height;

public:
  /**
   * @brief Construct a new Person object
   *
   */
  Person();

  /**
   * @brief Destroy the Person object
   *
   */
  ~Person();

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
};