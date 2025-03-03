#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void suma(int a, int b, int *c){
*c = a+b;
}