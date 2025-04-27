#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_2_shared(int columns, int rows, float* mat1, float* matanswer) {
    __shared__ float temp_answer[32];

    // Initialize shared memory more efficiently
    if (threadIdx.y == 0 && threadIdx.x < 32) {
        temp_answer[threadIdx.x] = 0.0f;
    }
    __syncthreads();  // Ensure all initializations are complete

    int thread_mat_colid = blockIdx.x * blockDim.x + threadIdx.x;
    int thread_mat_rowid = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (thread_mat_colid < columns && thread_mat_rowid < rows) {
        int position_in_matrix = thread_mat_rowid * columns + thread_mat_colid;
        
        // Use block wide reduction in shared memory
        atomicAdd(&(temp_answer[threadIdx.x]), mat1[position_in_matrix]);
        
        if (blockIdx.x == 0 && blockIdx.y == 1 && threadIdx.x == 0 && threadIdx.y == 0) {
            printf("%d Value %f \n", position_in_matrix, mat1[position_in_matrix]);
        }
    }
    __syncthreads();  // Ensure all atomic additions are complete

    // Write results from shared memory to global memory only when necessary
    if (threadIdx.y == 0 && thread_mat_colid < columns) {
        atomicAdd(&(matanswer[thread_mat_colid]), temp_answer[threadIdx.x]);
    }
}