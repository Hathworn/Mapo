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
    // Calculate global index using grid stride loop
    for (int index = blockIdx.x * blockDim.x + threadIdx.x; index < size; index += blockDim.x * gridDim.x)
    {
        C[index] = A[index] + B[index];
    }
}