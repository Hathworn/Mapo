#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Launch multiple blocks along y-axis to cover entire data in case of large N
    int stride = blockDim.x * gridDim.x;

    // Use a loop to process multiple elements per thread to ensure full GPU utilization
    for (int idx = i; idx < N; idx += stride) {
        X[idx * INCX] *= ALPHA;
    }
}