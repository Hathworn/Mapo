#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sum(int *a, int *b, int *c){
*c = *a + *b;
}