#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void print_threadIds()
{
    // Use single printf to reduce overhead 
    printf("Thread ID - x: %d, y: %d, z: %d\n", threadIdx.x, threadIdx.y, threadIdx.z);
}