#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Optimize thread indexing calculation
    if(i >= N) return;

    int b = i / (layers * spatial);  // Precompute b to reduce redundant calculations
    int in_c = (i / spatial) % layers;  // Optimize the index calculations using properties of modulo and division
    int in_s = i % spatial;

    int i1 = b * layers * spatial + in_c * spatial + in_s;  // Optimize memory access pattern
    int i2 = b * layers * spatial + in_s * layers + in_c;

    if (forward) 
        out[i2] = x[i1];  // Optimize conditional operation
    else 
        out[i1] = x[i2];
}