#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sqr_mag_kernel(const float *data, float *result, int total)
{
    // Use a single index calculation, threads check their range safely
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int dataIdx = 2 * idx;

    if (idx < total) {
        float real = data[dataIdx];
        float imag = data[dataIdx + 1];
        result[idx] = real * real + imag * imag;
        result[dataIdx + 1] = 0.0f; // Simplified setting imaginary part to 0
    }
}