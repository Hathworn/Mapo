#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    // Calculate the global index of the element
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread processes valid data
    if (index >= N) return;
    
    // Compute the indices using modulus and division
    int in_s = index % spatial;
    index = index / spatial;
    int in_c = index % layers;
    index = index / layers;
    int b = index;

    // Compute flat index positions for source and destination
    int i1 = b * layers * spatial + in_c * spatial + in_s;
    int i2 = b * layers * spatial + in_s * layers + in_c;

    // Forward or backward path
    if (forward) 
        out[i2] = x[i1];
    else 
        out[i1] = x[i2];
}