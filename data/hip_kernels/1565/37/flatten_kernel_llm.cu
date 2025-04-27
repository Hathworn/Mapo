#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation for 1D grid
    if (index >= N) return;

    int b = index / (layers * spatial);
    int in_c = (index / spatial) % layers;
    int in_s = index % spatial;

    int i1 = b * layers * spatial + in_c * spatial + in_s;
    int i2 = b * layers * spatial + in_s * layers + in_c;

    if (forward) {
        out[i2] = x[i1]; // Optimized memory write for forward direction
    } else {
        out[i1] = x[i2]; // Optimized memory write for backward direction
    }
}