#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void hellofromGPU(void)
{
printf("hello world  \n");
}