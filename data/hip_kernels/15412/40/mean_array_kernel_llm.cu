#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mean_array_kernel(float *src, int size, float alpha, float *avg)
{
    // Calculate thread ID
    const int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread is within bounds
    if (i < size) {
        float temp_avg = avg[i] * (1 - alpha) + src[i] * alpha; // Compute updated avg
        src[i] = temp_avg; // Update src with new avg
        avg[i] = temp_avg; // Update avg with new computed value
    }
}