#include "hip/hip_runtime.h"
#include "includes.h"
#ifdef __cplusplus
extern "C" {
#endif

#ifdef __cplusplus
}
#endif
__global__ void vec_add_double(double *A, double *B, double* C, int size)
{
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for better performance
    __shared__ double sA[256];
    __shared__ double sB[256];
    
    if(index < size) {
        // Load data into shared memory
        sA[threadIdx.x] = A[index];
        sB[threadIdx.x] = B[index];
        __syncthreads(); // Ensure all threads have loaded their data

        // Perform the addition
        C[index] = sA[threadIdx.x] + sB[threadIdx.x];
    }
}