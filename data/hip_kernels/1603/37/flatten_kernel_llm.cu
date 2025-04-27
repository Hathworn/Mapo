#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    // Calculate the global index for the current thread
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    // Check if the index is within bounds
    if(i >= N) return;
    
    // Decompose the index to get the input spatial, layer, and batch indices
    int in_s = i % spatial;
    int rem = i / spatial;
    int in_c = rem % layers;
    int b = rem / layers;

    // Calculate the input and output indices based on the forward flag
    int i1 = b * layers * spatial + in_c * spatial + in_s;
    int i2 = b * layers * spatial + in_s * layers + in_c;

    // Perform the forward or backward operation
    if (forward) 
        out[i2] = x[i1];
    else 
        out[i1] = x[i2];
}