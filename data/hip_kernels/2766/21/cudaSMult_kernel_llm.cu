#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSMult_kernel(unsigned int size, float* a, float* b, const float beta, float* result)
{
    // Calculate global thread index
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Reduce branching by using a single loop
    for (unsigned int i = index; i < size; i += stride) {
        float temp = a[i] * b[i];
        // Use a conditional operator for concise beta handling
        result[i] = (beta != 0.0f) ? temp + beta * result[i] : temp;
    }
}