#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void print(int *d_predicateArrry, int numberOfElements)
{
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within range
    if (index < numberOfElements) {
        printf("index = %d value = %d\n", index, d_predicateArrry[index]);
    }
}