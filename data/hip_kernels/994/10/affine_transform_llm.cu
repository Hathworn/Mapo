#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void affine_transform(size_t sz, float_t* audio, float_t* end_out, size_t stride)
{
    size_t index = blockDim.x * blockIdx.x + threadIdx.x;

    // Optimized computation:
    if (index < sz)
    {
        float_t end_out_val = end_out[index];
        float_t exp_val = __expf(end_out[index + stride]); // Use __expf for faster computation
        audio[index + stride] = (audio[index + stride] - end_out_val) / exp_val;
    }
}