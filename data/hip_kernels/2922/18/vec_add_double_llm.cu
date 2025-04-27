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
    // Calculate thread's unique global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure all threads are synchronized before performing vector addition
    if (index < size)
    {
        C[index] = A[index] + B[index];
    }
}