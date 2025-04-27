#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Use grid-stride loop for better utilization of GPU resources
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < N; i += blockDim.x * gridDim.x) {
        if ((X[i*INCX] * X[i*INCX]) < (ALPHA * ALPHA)) {
            X[i*INCX] = 0;
        }
    }
}