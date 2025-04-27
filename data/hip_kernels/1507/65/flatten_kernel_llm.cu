#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    // Calculate unique index for the thread
    int i = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    
    // Boundary check
    if(i >= N) return;

    // Pre-compute indices to reduce redundant calculations
    int b = i / (spatial * layers);
    int rem = i % (spatial * layers);
    int in_c = rem / spatial;
    int in_s = rem % spatial;

    // Compute source and destination indices for flatten operation
    int i1 = b*layers*spatial + in_c*spatial + in_s;
    int i2 = b*layers*spatial + in_s*layers + in_c;

    // Copy data forward or backward into output based on the given flag
    if (forward) out[i2] = x[i1];
    else out[i1] = x[i2];
}