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

    // Use a conditional operator to avoid branch divergence
    C[index] = (index < size) ? A[index] + B[index] : 0.0f;
}