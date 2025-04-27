#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void max_norm_matrix(float* mat1, int row, int col, int* norm, float* final_norm) {
    // Use shared memory for faster atomic operations
    extern __shared__ int shared_norm[];
    int tid = threadIdx.x;
    shared_norm[tid] = 0; // Initialize shared memory
    __syncthreads();

    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int size = row * col;
    
    if (id < size) {
        atomicMax(&shared_norm[tid], __float_as_int(abs(mat1[id])));
    }
    __syncthreads();

    // Use one thread to update the global norm based on shared memory
    if (tid == 0) {
        for (int i = 0; i < blockDim.x; ++i) {
            atomicMax(norm, shared_norm[i]);
        }
    }
    __syncthreads();

    // Use the first thread to compute the final norm
    if (id == 0) {
        *final_norm = __int_as_float(*norm);
    }
}