#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified thread index calculation
    if (i >= N) return;

    int b = i / (spatial * layers);  // Compute batch index
    int rem = i % (spatial * layers);  // Remaining index after batch calculation
    int in_c = rem / spatial;  // Compute layer index
    int in_s = rem % spatial;  // Compute spatial index
    
    // Compute direct index for input and output
    int i1 = b * layers * spatial + in_c * spatial + in_s;
    int i2 = b * layers * spatial + in_s * layers + in_c;

    // Forward or backward based on 'forward' flag
    if (forward) 
        out[i2] = x[i1];
    else 
        out[i1] = x[i2];
}