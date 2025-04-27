#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Loop over the data to maximize occupancy and cover larger data sizes
    for (int i = idx; i < N; i += stride) {
        float val = X[i * INCX];
        if((val * val) < (ALPHA * ALPHA)) {
            X[i * INCX] = 0;
        }
    }
}