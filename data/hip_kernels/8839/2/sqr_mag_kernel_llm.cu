#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sqr_mag_kernel(float *data, float *result) 
{
    int globalId = blockIdx.x * blockDim.x + threadIdx.x;  // Use single dimension for block and thread indexing
    int threadId = 2 * globalId; // Calculate actual position in data

    float real = data[threadId];               // Load real part
    float imag = data[threadId + 1];           // Load imaginary part
    result[threadId] = real * real + imag * imag; // Compute squared magnitude
    result[threadId + 1] = 0;                  // Set imaginary part of the result to zero
}