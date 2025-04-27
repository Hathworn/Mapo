#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(float *g_data, float value)
{
    // Use shared memory for better data locality
    __shared__ float shared_data[256]; // Assumes blockDim.x is 256 or less

    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int localIdx = threadIdx.x;

    // Load data into shared memory
    shared_data[localIdx] = g_data[idx];
    __syncthreads(); // Ensure all loads are completed

    // Perform computation using shared memory
    shared_data[localIdx] += value;

    __syncthreads(); // Ensure all computations are done

    // Store the result back to global memory
    g_data[idx] = shared_data[localIdx];
}