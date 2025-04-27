```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    // Compute global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    if (index >= N) return;

    // Calculate in_s, in_c, and batch index b
    int in_s = index % spatial;
    int layer_index = index / spatial;
    int in_c = layer_index % layers;
    int b = layer_index / layers;

    // Calculate flat index for input and output
    int i1 = b * layers * spatial + in_c * spatial + in_s;
    int i2 = b * layers * spatial + in_s * layers + in_c;

    // Assign values based on forwarding condition
    if (forward) out[i2] = x[i1];
    else out[i1] = x[i2];
}