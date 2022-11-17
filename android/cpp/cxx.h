#include <string>

class Cxx {
private:
  static Cxx *m_self; // 单例模式
  Cxx(const Cxx &) = delete;
  Cxx &operator=(const Cxx &) = delete;
  Cxx();
  std::string m_name;
  int m_age;
  double m_weight;
  double m_height;
  bool m_flag;

public:
  static Cxx *getInstance();
  ~Cxx();
  void setName(std::string name);
  std::string *getName();
  void setAge(int age);
  int getAge();
  void setWeight(double weight);
  double getWeight();
  void setHeight(double height);
  double getHeight();
  void setFlag();
  bool getFlag();
};