#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function optimized with loop unrolling and strided access
__global__ void square_array(float *a, int N)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int gridSize = blockDim.x * gridDim.x;

    // Loop unrolling with strided access
    for (int i = idx; i < N; i += gridSize) {
        a[i] *= a[i];
    }
}