```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mask_kernel_new_api(int n, float *x, float mask_num, float *mask, float val)
{
    // Use blockIdx.x directly with gridDim.x for simplified indexing
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Correct loop iteration for thread-compact execution
    for (int idx = i; idx < n; idx += blockDim.x * gridDim.x) {
        if (mask[idx] == mask_num) {
            x[idx] = val;
        }
    }
}