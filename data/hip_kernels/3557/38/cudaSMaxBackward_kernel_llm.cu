#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cudaSMaxBackward_kernel(unsigned int size, float* diffInput, const unsigned int idx, unsigned int* argMax, const float beta, float* result)
{
    // Calculate the global thread index
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate the total number of threads used
    const unsigned int stride = blockDim.x * gridDim.x;

    // Loop over elements with strided access pattern
    for (unsigned int i = index; i < size; i += stride) {
        // Use ternary operator to update result based on argMax match
        result[i] = (argMax[i] == idx) ? (diffInput[i] + beta * result[i]) : beta * result[i];
    }
}