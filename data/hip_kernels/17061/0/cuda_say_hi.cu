#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cuda_say_hi() {
printf("Hi, CUDA!\n");
}