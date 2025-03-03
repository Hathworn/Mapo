#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void helloGPU()
{
printf("Hello from the GPU.\n");
}