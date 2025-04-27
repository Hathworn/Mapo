#include "hip/hip_runtime.h"
#include "includes.h"

// Improved global kernel
__global__ void loop()
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    printf("This is iteration number %d\n", idx); // Use global index for iteration count
}