#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global thread index for the flattened grid.
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride to allow for larger number of threads handling more data.
    int stride = blockDim.x * gridDim.x;

    // Loop through all indices this thread is responsible for.
    for (; i < N; i += stride) {
        // Pre-calculate the index multiplication once per iteration.
        int idx = i * INCX;
        if ((X[idx] * X[idx]) < (ALPHA * ALPHA)) {
            X[idx] = 0;
        }
    }
}