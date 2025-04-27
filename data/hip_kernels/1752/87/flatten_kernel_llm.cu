#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i >= N) return;
    
    int b = i / (layers * spatial); // Calculate the batch index
    int index = i % (layers * spatial); // Compute remaining index within batch
    int in_c = index / spatial; // Calculate channel index
    int in_s = index % spatial; // Calculate spatial index

    int i1 = b * layers * spatial + in_c * spatial + in_s; // Input index calculation
    int i2 = b * layers * spatial + in_s * layers + in_c; // Output index calculation

    // Efficiently map input to output based on forward flag
    if (forward)
        out[i2] = x[i1];
    else
        out[i1] = x[i2];
}