#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void seq_max_norm(float* mat1, int row, int col, float* norm) {
    // Utilize shared memory for partial results
    __shared__ float shared_norm;
    
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int num_threads = blockDim.x * gridDim.x;

    // Initialize shared memory to zero
    if (threadIdx.x == 0) shared_norm = 0.0f;
    __syncthreads();

    // Calculate maximum in parallel
    float local_max = 0.0f;
    for (int idx = tid; idx < row * col; idx += num_threads) {
        local_max = max(abs(mat1[idx]), local_max);
    }

    // Reduce local maxima to shared memory
    atomicMax(&shared_norm, local_max);
    __syncthreads();

    // Update global norm from shared memory
    if (threadIdx.x == 0) {
        atomicMax(norm, shared_norm);
    }
}