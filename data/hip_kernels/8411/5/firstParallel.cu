#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void firstParallel()
{
printf("This should be running in parallel.\n");
}