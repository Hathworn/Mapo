#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sayHi()
{
printf("Cuda Kernel Hello Word.\n");
}