#include "hip/hip_runtime.h"
#include "includes.h"





__global__ void cuda_hello(){
printf("Hello World from GPU!\n");
}