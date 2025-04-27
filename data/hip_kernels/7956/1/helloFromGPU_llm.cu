
#include "hip/hip_runtime.h"
#include "includes.h"

/*
1. Memory Copy Cost   One-Step
2. Straggler: Ring-based
**/
using namespace std;

#define Malloc(type,n) (type *)malloc((n)*sizeof(type))

__global__ void helloFromGPU(void)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Compute global index
    if (idx == 0) // Ensure only one thread prints the message
    {
        printf("Hello from GPU\n");
    }
}
