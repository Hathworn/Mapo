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
    // Calculate the global thread index in a more readable way
    int index = hipBlockIdx_x * hipBlockDim_x + hipThreadIdx_x;

    // Use shared memory to optimize memory access
    extern __shared__ float sharedMem[];
    if (index < size) {
        sharedMem[threadIdx.x] = A[index] + B[index];
        __syncthreads();  // Ensure all threads have written to shared memory

        // Write the result to global memory
        C[index] = sharedMem[threadIdx.x];
    }
}