#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;  // Calculate the stride for the loop

    // Loop through the elements with a stride equal to the total number of threads
    for(; i < N; i += stride) {
        X[i * INCX] *= ALPHA;
    }
}