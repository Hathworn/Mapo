#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Naive_Hist(int* d_result, int* d_hist, int n_vertices) {
    int row = blockIdx.x;
    int row2 = threadIdx.x;

    __shared__ int count; // Shared counter for each block

    // Initialize count to zero using the first thread of the block
    if (row2 == 0) count = 0;
    __syncthreads();

    // Loop through vertices with a stride of blockDim.x for better GPU utilization
    if (row < n_vertices) {
        for (int i = row2; i < n_vertices; i += blockDim.x) {
            bool equal = true;
            for (int j = 0; j < n_vertices; j++) {
                if (d_result[row * n_vertices + j] != d_result[i * n_vertices + j]) {
                    equal = false;
                    break;
                }
            }
            // Use atomic function to safely update shared count
            if (equal) atomicAdd(&count, 1);
        }
    }

    // Synchronization to ensure all threads have updated the count
    __syncthreads();

    // Update histogram atomically
    if (row < n_vertices && row2 == 0 && count > 0) {
        atomicAdd(&d_hist[count], 1);
    }
}