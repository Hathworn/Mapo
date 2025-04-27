#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void helloFromGPU(void)
{
    // Use faster branch-less logic with arithmetic
    const int selectedThread = 5; 
    printf("Hello World from GPU thread %d!\n", threadIdx.x * (threadIdx.x == selectedThread));
}