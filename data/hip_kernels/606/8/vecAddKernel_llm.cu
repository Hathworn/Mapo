#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAddKernel(float *A, float *B, float *C, int n) {
    // Use shared memory for input vectors
    extern __shared__ float shared_mem[];
    float *shared_A = shared_mem;
    float *shared_B = shared_mem + blockDim.x;

    int i = threadIdx.x + blockDim.x * blockIdx.x;

    // Load data into shared memory if within bounds
    if (i < n) {
        shared_A[threadIdx.x] = A[i];
        shared_B[threadIdx.x] = B[i];
    }
    // Sync threads in the block to ensure all data is loaded
    __syncthreads();

    // Ensure calculation is done only for valid indices
    if (i < n) {
        C[i] = shared_A[threadIdx.x] + shared_B[threadIdx.x];
    }
}