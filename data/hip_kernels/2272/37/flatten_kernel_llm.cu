#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    if(i >= N) return;

    // Compute indices for input and output
    int in_s = i % spatial;
    int in_c = (i / spatial) % layers;
    int b = i / (spatial * layers);
    
    int i1 = b * layers * spatial + in_c * spatial + in_s;
    int i2 = b * layers * spatial + in_s * layers + in_c;
    
    // Conditional data transfer between arrays
    if (forward) { 
        out[i2] = x[i1];
    } else { 
        out[i1] = x[i2];
    }
}