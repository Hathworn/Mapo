#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void testKernel()
{
printf("hi!\n");
}