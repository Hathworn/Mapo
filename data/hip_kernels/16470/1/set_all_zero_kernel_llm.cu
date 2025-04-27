#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_all_zero_kernel(double *ua_gpu, double *ub_gpu, double *uc_gpu)
{
    // Calculate global index to improve memory access pattern and reduce divergence
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < blockDim.x * gridDim.x) {
        ua_gpu[idx] = 0;
        ub_gpu[idx] = 0;
        uc_gpu[idx] = 0;
    }
}