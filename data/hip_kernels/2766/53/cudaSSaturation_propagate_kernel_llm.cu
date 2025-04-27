#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSSaturation_propagate_kernel(float* x, float* y, unsigned int size, int shifting, float threshold)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use shared memory to avoid repeated shift calculations when possible
    __shared__ float shiftFactor;
    if (threadIdx.x == 0) {
        shiftFactor = (shifting > 0) ? (1.0f / (1 << shifting)) : ((shifting < 0) ? (1 << (-shifting)) : 1.0f);
    }
    __syncthreads();

    for (unsigned int i = index; i < size; i += stride) {
        float value = x[i] * shiftFactor; // Apply the precomputed shift factor

        // Saturate 'value' using threshold
        if (threshold != 0.0f) {
            y[i] = (value < -threshold) ? -threshold
                 : (value > threshold) ? threshold
                 : value;
        } else {
            y[i] = value; // Direct copy if no threshold
        }
    }
}