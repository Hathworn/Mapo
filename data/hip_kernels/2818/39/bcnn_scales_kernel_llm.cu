```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bcnn_scales_kernel(float *output, float *biases, int n, int size) {
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int filter = blockIdx.y;
    int batch = blockIdx.z;

    if (offset < size) {
        // Precompute index for better performance
        int idx = (batch * n + filter) * size + offset;
        output[idx] *= biases[filter];
    }
}