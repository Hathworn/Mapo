#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread index

    if(idx >= N) return;

    // Unroll the loop for better performance
    int b = idx / (layers * spatial);
    int rem = idx % (layers * spatial);
    int in_c = rem / spatial;
    int in_s = rem % spatial;

    int i1 = b * layers * spatial + in_c * spatial + in_s;
    int i2 = b * layers * spatial + in_s * layers + in_c;

    if (forward) 
        out[i2] = x[i1];
    else 
        out[i1] = x[i2];
}