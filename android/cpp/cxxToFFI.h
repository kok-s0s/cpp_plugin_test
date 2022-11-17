#include "Cxx.h"
#include <iostream>

extern "C" {

/**
 * @brief Set the Person Name object
 *
 * @param name
 */
void setPersonName(char *name);

/**
 * @brief Get the Person Name object
 *
 * @return char*
 */
char *getPersonName();

/**
 * @brief Set the Person Age object
 *
 * @param age
 */
void setPersonAge(int age);

/**
 * @brief Get the Person Age object
 *
 * @return int
 */
int getPersonAge();

/**
 * @brief Set the Person Weight object
 *
 * @param weight
 */
void setPersonWeight(double weight);

/**
 * @brief Get the Person Weight object
 *
 * @return double
 */
double getPersonWeight();

/**
 * @brief Set the Person Height object
 *
 * @param height
 */
void setPersonHeight(double height);

/**
 * @brief Get the Person Height object
 *
 * @return double
 */
double getPersonHeight();

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
}