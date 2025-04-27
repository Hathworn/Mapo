#include "hip/hip_runtime.h"
#include "includes.h"
#ifdef __cplusplus
extern "C" {
#endif






#ifdef __cplusplus
}
#endif
__global__ void vec_add(float *A, float *B, float* C, int size)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for performance optimization
    extern __shared__ float shared[];

    if (index < size) {
        // Load the vectors from global memory to shared memory
        shared[threadIdx.x] = A[index];
        shared[threadIdx.x + blockDim.x] = B[index];

        // Synchronize to ensure all threads have loaded their data
        __syncthreads();

        // Perform the addition and store the result back to global memory
        C[index] = shared[threadIdx.x] + shared[threadIdx.x + blockDim.x];
    }
}