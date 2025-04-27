#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    // Calculate the flattened index of the current thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a more efficient loop boundary check
    if (i >= N) return;
    
    // Calculate spatial, channel, and batch indices using division and modulo
    int in_s = i % spatial;
    int in_c = (i / spatial) % layers;
    int b = i / (spatial * layers);
    
    // Compute positions based on forward flag
    int i1 = b * layers * spatial + in_c * spatial + in_s;
    int i2 = b * layers * spatial + in_s * layers +  in_c;
    
    // Conditional assignment based on forward flag
    if (forward) {
        out[i2] = x[i1];
    } else {
        out[i1] = x[i2];
    }
}