#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecSum(double* devIn, int pow_step, int n)
{
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure threads do not access out-of-bounds memory
    int index = pow_step * i;
    if(index + (pow_step / 2) < n)
    {
        // Combine elements and store the result in the first element
        devIn[index] += devIn[index + (pow_step / 2)];
    }
}