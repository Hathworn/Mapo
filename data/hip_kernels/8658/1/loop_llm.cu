#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void loop()
{
    // Optimize printf by reducing the number of calls
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < gridDim.x * blockDim.x) {
        printf("This is iteration number %d\n", idx);
    }
}