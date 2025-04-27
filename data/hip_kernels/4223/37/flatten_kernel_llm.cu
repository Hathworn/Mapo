#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out) {
    // Calculate unique global index for each thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Exit if index 'i' is out of bounds
    if (i >= N) return;

    // Calculate indices based on global index 'i'
    int in_s = i % spatial;
    int in_c = (i / spatial) % layers;
    int b = i / (spatial * layers);

    // Compute input and output indices
    int i1 = b * layers * spatial + in_c * spatial + in_s;
    int i2 = b * layers * spatial + in_s * layers + in_c;
    
    // Assign to output based on the 'forward' flag
    if (forward) out[i2] = x[i1];
    else out[i1] = x[i2];
}