#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize stride calculation and loop condition for better memory access pattern and performance
__global__ void fmaf_kernel(float *d_x, float *d_y, float *d_z, int size)
{
    int idx_x = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to minimize global memory access if possible
    __shared__ float shared_x[blockDim.x];
    __shared__ float shared_y[blockDim.x];
    
    for (int i = idx_x; i < size; i += blockDim.x * gridDim.x) {
        shared_x[threadIdx.x] = d_x[i]; // Load to shared memory
        shared_y[threadIdx.x] = d_y[i]; // Load to shared memory
        __syncthreads(); // Synchronize to ensure memory consistency
        
        // Perform fmaf operation using values in shared memory
        d_z[i] = fmaf(shared_x[threadIdx.x], shared_y[threadIdx.x], 0.f);

        __syncthreads(); // Synchronize before next iteration
    }
}