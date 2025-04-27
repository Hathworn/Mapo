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
    // Calculate global thread ID
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Loop for efficiency, process more elements per thread
    for (int i = index; i < size; i += stride) {
        C[i] = A[i] + B[i];
    }
}