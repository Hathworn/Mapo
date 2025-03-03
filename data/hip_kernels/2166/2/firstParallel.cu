#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void firstParallel()
{
printf("This is running in parallel.\n");
}