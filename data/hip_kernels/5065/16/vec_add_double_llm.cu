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
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Calculate stride for multiple grid iterations

    // Loop over data with stride to ensure all elements are covered
    for (int i = index; i < size; i += stride) {
        C[i] = A[i] + B[i];
    }
}