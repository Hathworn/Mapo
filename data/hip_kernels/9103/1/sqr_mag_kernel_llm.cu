#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sqr_mag_kernel(const float *data, float *result, int total)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate 1D index.
    int dataIndex = 2 * idx; // Compute index for data array.

    if (idx < total) { // Ensure within bounds.
        float real = data[dataIndex]; // Load real part.
        float imag = data[dataIndex + 1]; // Load imaginary part.
        result[dataIndex] = real * real + imag * imag; // Compute squared magnitude.
        result[dataIndex + 1] = 0; // Set imaginary part to zero.
    }
}