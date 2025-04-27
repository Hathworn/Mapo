#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sqr_mag_kernel(const float *data, float *result, int total)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure we're only accessing valid entries within the bound
    if (idx < total) {
        int dataIndex = 2 * idx;

        // Perform single read operation
        float real = data[dataIndex];
        float imag = data[dataIndex + 1];

        // Calculate squared magnitude
        result[dataIndex] = real * real + imag * imag;
        // Reset imaginary part to zero
        result[dataIndex + 1] = 0;
    }
}