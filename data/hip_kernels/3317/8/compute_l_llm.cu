#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compute_l(double *dev_w, int n_patch)
{
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Pre-compute stride for efficiency
    int N = n_patch * n_patch;

    for (; tid < N; tid += stride) { // Use for-loop with pre-computed stride
        dev_w[tid] = ((tid % (n_patch + 1) == 0) ? 1.0 : 0.0) - dev_w[tid];
    }
}