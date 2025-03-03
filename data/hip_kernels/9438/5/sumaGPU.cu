#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumaGPU(int a, int b, int *sol){

*sol = a + b;
}