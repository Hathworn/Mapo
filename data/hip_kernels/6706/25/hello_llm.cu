#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x; // Calculate global index
    printf("Hello world! I'm thread %d\n", idx);     // Use global index for unique identification
}