#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void strided_access(float* a, int s, int max) {
    // Calculate the global index with stride
    int base_idx = idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride_idx = base_idx * s;

    // Loop using stride to avoid boundary check each iteration
    for (; stride_idx < max; stride_idx += s) {
        a[stride_idx] = a[stride_idx] + 1;
    }
}