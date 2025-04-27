#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i >= N) return;
    
    // Calculate indices using modulo and integer division
    int in_s = i % spatial;
    int in_c = (i / spatial) % layers;
    int b = i / (spatial * layers);

    // Calculate flattened indices for input and output
    int i1 = b * layers * spatial + in_c * spatial + in_s;
    int i2 = b * layers * spatial + in_s * layers + in_c;

    // Assign elements based on the forward flag
    if (forward) out[i2] = x[i1];
    else out[i1] = x[i2];
}