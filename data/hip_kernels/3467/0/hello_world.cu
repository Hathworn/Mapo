#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void hello_world()
{
printf("Hello World from Thread %d !\n", threadIdx.x);
}