#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void clearLabel(bool *label, unsigned int size)
{
    unsigned int id = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread ID
    if (id < size) {
        label[id] = false; // Set label to false
    }
}