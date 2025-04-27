#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void prod_strided_float(int n, int xOffset, float *dx, int incx, float result) {
    // Use shared memory for CUDA block reduction
    __shared__ float shared_result;
    int tid = threadIdx.x;
    
    // Initialize shared memory for each block
    if (tid == 0) shared_result = 1.0f;
    __syncthreads();

    // Use a local variable to accumulate product
    float thread_product = 1.0f;

    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += blockDim.x * gridDim.x) {
        if(i >= xOffset && i % incx == 0) {
            thread_product *= dx[i];
        }
    }

    // Atomic multiplication to accumulate results in shared memory
    atomicExch(&shared_result, shared_result * thread_product);
    __syncthreads();

    // Write the block's final result to the global result
    if (tid == 0) {
        atomicExch(&result, result * shared_result);
    }
}