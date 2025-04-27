#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread ID
    if(tid >= N) return;

    int in_s = tid % spatial;
    int remaining = tid / spatial;
    int in_c = remaining % layers;
    int b = remaining / layers;

    int i1 = b * layers * spatial + in_c * spatial + in_s;
    int i2 = b * layers * spatial + in_s * layers + in_c;

    if (forward) {
        out[i2] = x[i1];
    } else {
        out[i1] = x[i2];
    }
}