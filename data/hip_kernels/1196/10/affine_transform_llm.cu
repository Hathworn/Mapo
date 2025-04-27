#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void affine_transform(size_t sz, float_t* audio, float_t* end_out, size_t stride)
{
    // Calculate global thread index
    size_t index = blockDim.x * blockIdx.x + threadIdx.x;

    // Optimize memory access pattern
    if(index + stride < sz + stride)
    {
        float_t out_index = end_out[index];
        audio[index + stride] = (audio[index + stride] - out_index) / expf(end_out[index + stride]);
    }
}