#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_2_shared(int columns, int rows, float* mat1, float* matanswer) {
    // Use shared memory for temporary storage
    __shared__ float temp_answer[32];
    
    // Initialize shared memory only by the first row of threads
    if (threadIdx.y == 0) {
        temp_answer[threadIdx.x] = 0.0f;
    }
    __syncthreads();

    int thread_mat_colid = blockIdx.x * blockDim.x + threadIdx.x;
    int thread_mat_rowid = blockIdx.y * blockDim.y + threadIdx.y;
    int position_in_matrix = thread_mat_rowid * columns + thread_mat_colid;

    // Each thread accumulates its matrix element into shared memory
    if (thread_mat_colid < columns && thread_mat_rowid < rows) {
        atomicAdd(&(temp_answer[threadIdx.x]), mat1[position_in_matrix]);
    }
    __syncthreads();

    // Check specific condition for debug print
    if (blockIdx.x == 1 && blockIdx.y == 0 && threadIdx.x == 0 && threadIdx.y == 0) {
        printf("%d Value %f \n", position_in_matrix, mat1[position_in_matrix]);
    }

    // Update the global matrix answer only by the last row of threads
    if (threadIdx.y == blockDim.y - 1) {
        atomicAdd(&(matanswer[thread_mat_colid]), temp_answer[threadIdx.x]);
    }
}