#include "type.h"

#pragma region Integer

int8_t type_int8() { return 127; }

int16_t type_int16() { return 32767; }

int32_t type_int32() { return 2147483647; }

int64_t type_int64() { return 9223372036854775807; }

uint8_t type_uint8() { return 255; }

uint16_t type_uint16() { return 65535; }

uint32_t type_uint32() { return 4294967295; }

uint64_t type_uint64() { return 18446744073709551615; }

int type_int() { return 2147483647; }

long type_long() { return 9223372036854775807; }

long long type_long_long() { return 9223372036854775807; }

short type_short() { return 32767; }

unsigned int type_unsigned_int() { return 4294967295; }

unsigned long type_unsigned_long() { return 18446744073709551615; }

unsigned long long type_unsigned_long_long() { return 18446744073709551615; }

unsigned short type_unsigned_short() { return 65535; }

#pragma endregion

#pragma region Struct

Person init_person(char *name, int age, double weight, double height) {
  Person st = {name, age, weight, height};
  return st;
}

Person *init_person_pointer(char *name, int age, double weight, double height) {
  auto *person = (Person *)new Person;
  person->name = name;
  person->age = age;
  person->weight = weight;
  person->height = height;
  return person;
}

void change_person_age(Person *person) { person->age *= 2; }

#pragma endregion