#include "hip/hip_runtime.h" 
#include "includes.h"

// Kernel to double values using shared memory for improved memory access pattern
__global__ void double_value(double *x, double *y) 
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Compute global index
    // Use shared memory to reduce global memory access
    __shared__ double shared_x[256]; // Assuming block size is 256, adjust if needed
    shared_x[threadIdx.x] = x[idx]; // Load data to shared memory
    __syncthreads(); // Ensure all threads have written to shared memory
    y[idx] = 2.0 * shared_x[threadIdx.x]; // Compute result using shared memory
}