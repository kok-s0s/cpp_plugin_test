#include <string>

using std::string;

class Cxx {
private:
  static Cxx* m_self; // 单例模式
  Cxx(const Cxx&) = delete;
	Cxx& operator=(const Cxx&) = delete;
  Cxx();
  string m_name;
  int m_age;
  double m_weight;
  double m_height;

public:
  static Cxx* getInstance();
  ~Cxx();
  void setName(string name);
  string* getName();
  void setAge(int age);
  int getAge();
  void setWeight(double weight);
  double getWeight();
  void setHeight(double height);
  double getHeight();
};