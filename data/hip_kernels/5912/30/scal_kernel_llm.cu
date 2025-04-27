#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Use one dimensional grid index for simpler computation
    int stride = gridDim.x * blockDim.x; // Calculate stride for loop unrolling
    for(int i = idx; i < N; i += stride) { // Process multiple elements per thread for better occupancy
        X[i * INCX] *= ALPHA;
    }
}