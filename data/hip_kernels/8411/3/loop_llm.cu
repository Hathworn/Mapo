#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void loop()
{
    // Calculate global thread index
    int globalIndex = threadIdx.x + blockIdx.x * blockDim.x;

    // Print the iteration number using the calculated global index
    printf("This is iteration number %d\n", globalIndex);
}