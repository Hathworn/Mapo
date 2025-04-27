#include "hip/hip_runtime.h"
#include "includes.h"

/* Optimized GPU kernel code */

// Optimized kernel function using shared memory for faster access
__global__ void matrix_elementwise_div_by_const_kernal(const float *d_in, float *d_out, float val, int n) {
    // Calculate global index
    int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for improved performance
    __shared__ float shared_in[256];
    
    // Copy data from global to shared memory if index is in range
    if (globalIdx < n) {
        shared_in[threadIdx.x] = d_in[globalIdx];
    }
    
    // Synchronize threads to make sure all data is copied
    __syncthreads();

    // Perform the division using shared memory
    if (globalIdx < n) {
        d_out[globalIdx] = shared_in[threadIdx.x] / val;
    }
}