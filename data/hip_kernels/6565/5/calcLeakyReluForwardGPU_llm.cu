#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcLeakyReluForwardGPU(float *in, float *out, int elements)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified id calculation for 1D grid

    if(id < elements) {
        float v = in[id];
        out[id] = (v < 0) ? 0.01 : v; // Use ternary operator for conditional assignment
    }
}

/* original
for( unsigned i = 0; i < data_size; ++i ){
float v = in.data[i];
if ( v < 0 ){
v = 0.01;
}
out.data[i] = v;
}
*/