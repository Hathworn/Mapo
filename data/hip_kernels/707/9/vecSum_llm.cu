#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecSum(double* devIn, int pow_step, int n)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure that the index is within bounds and the second element is valid
    if (i < n / pow_step)
    {
        // Perform the addition using a single memory read/write per element
        int index = pow_step * i;
        devIn[index] += devIn[index + (pow_step / 2)];
    }
}