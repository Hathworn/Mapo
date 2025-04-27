#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int greatest_row;  

__device__ void swap(float* arr, int ind_a, int ind_b) {
    float tmp = arr[ind_a];
    arr[ind_a] = arr[ind_b];
    arr[ind_b] = tmp;
}

__global__ void swapRow(float* mat, float* b, int cols, int num_block, int k) {
    int row_i = greatest_row;
    if (k != row_i) { // If the same row don't swap.
        int row_k = k * cols;
        int swap_row = row_i * cols;
        int i = threadIdx.x + blockIdx.x * blockDim.x;

        // Optimized loop with shared memory
        extern __shared__ float shared_mem[];
        for (int j = i; j < cols; j += num_block * blockDim.x) {
            shared_mem[threadIdx.x] = mat[swap_row + j];
            __syncthreads(); // Synchronize threads
            mat[swap_row + j] = mat[row_k + j];
            mat[row_k + j] = shared_mem[threadIdx.x];
            __syncthreads(); // Synchronize threads
        }
        
        // Swap b
        if (blockIdx.x == 0 && threadIdx.x == 0)
            swap(b, row_i, k);
    }
}