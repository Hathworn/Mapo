#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calc(float *d_D, int n, int k) { // Kernel
    __shared__ float s_d[3 * 256]; // Shared memory for block

    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global indices
    int j = blockIdx.y * blockDim.y + threadIdx.y;
    int b_index = 3 * (threadIdx.x + blockDim.x * threadIdx.y); // Shared memory index

    // Load data into shared memory
    s_d[b_index] = d_D[i + j * n];
    s_d[b_index + 1] = d_D[i + k * n];
    s_d[b_index + 2] = d_D[k + j * n];
    __syncthreads(); // Ensure all threads have loaded their data

    // Compute new distance
    if (s_d[b_index] > s_d[b_index + 1] + s_d[b_index + 2])
        s_d[b_index] = s_d[b_index + 1] + s_d[b_index + 2];
    __syncthreads(); // Ensure computation completes before writing back 

    // Store result back to global memory
    d_D[i + j * n] = s_d[b_index];
}