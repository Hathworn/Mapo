#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a loop to handle multiple elements per thread
    while (i < N) {
        int in_s = i % spatial;
        int idx = i / spatial;
        int in_c = idx % layers;
        int b = idx / layers;

        int i1 = b * layers * spatial + in_c * spatial + in_s;
        int i2 = b * layers * spatial + in_s * layers + in_c;

        if (forward) out[i2] = x[i1];
        else out[i1] = x[i2];

        // Move to the next element by total number of threads
        i += blockDim.x * gridDim.x;
    }
}