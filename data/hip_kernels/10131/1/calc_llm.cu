#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calc(float *d_D, int n, int k) {
    __shared__ float s_d[3*256]; // Shared memory allocation

    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global i index
    int j = blockIdx.y * blockDim.y + threadIdx.y; // Calculate global j index

    int b_index = 3 * (threadIdx.x + blockDim.x*threadIdx.y); // Calculate index in shared memory
    if (i < n && j < n) { // Ensure i and j are within bounds
        s_d[b_index] = d_D[i + j*n]; // Load data into shared memory
        s_d[b_index + 1] = d_D[i + k*n]; // Load data into shared memory
        s_d[b_index + 2] = d_D[k + j*n]; // Load data into shared memory

        __syncthreads(); // Synchronize threads within block

        if (s_d[b_index] > s_d[b_index + 1] + s_d[b_index + 2]) {
            s_d[b_index] = s_d[b_index + 1] + s_d[b_index + 2]; // Compute minimum distance
        }

        __syncthreads(); // Synchronize before writing to global memory

        d_D[i + j*n] = s_d[b_index]; // Write back to global memory
    }
}