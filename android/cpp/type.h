#include <iostream>

extern "C"
{
  #pragma region Integer

  int8_t type_int8();
  int16_t type_int16();
  int32_t type_int32();
  int64_t type_int64();

  uint8_t type_uint8();
  uint16_t type_uint16();
  uint32_t type_uint32();
  uint64_t type_uint64();

  int type_int();
  long type_long();
  long long type_long_long();
  short type_short();

  unsigned int type_unsigned_int();
  unsigned long type_unsigned_long();
  unsigned long long type_unsigned_long_long();
  unsigned short type_unsigned_short();

  #pragma endregion

  #pragma region Struct

  typedef struct {
    char *name;
    int age;
    double weight;
    double height;
  } Person;

  Person init_person(char *name, int age, double weight, double height);

  Person *init_person_pointer(char *name, int age, double weight, double height);

  void change_person_age(Person *person);

  #pragma endregion
}