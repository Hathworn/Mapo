#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void recover_results(short *results, const int search_depth, const int total_dl_matrix_row_num) {
    for (int i = threadIdx.x; i < total_dl_matrix_row_num; i = i + blockDim.x) {
        if (results[i] == search_depth) {
            results[i] = 0;
        }
    }
}

__global__ void recover_results(int *results, const int search_depth, const int total_dl_matrix_row_num) {
    // Calculate global index for the current thread
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Iterate over data in steps of the total number of threads
    for (; idx < total_dl_matrix_row_num; idx += blockDim.x * gridDim.x) {
        if (results[idx] == search_depth) {
            results[idx] = 0;
        }
    }
}