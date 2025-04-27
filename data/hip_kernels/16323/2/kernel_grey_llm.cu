#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_grey(float4* d_Iin, float* d_Iout, int numel) {
    size_t idx = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Ensure the index is within bounds
    if (idx < numel) {
        float4 pixel = d_Iin[idx];
        
        // Utilize built-in functions for non-redundant computation
        float grey = __fmaf_rn(0.2989f, pixel.x, __fmaf_rn(0.5870f, pixel.y, 0.1140f * pixel.z));
        
        // Write the result to the output array
        d_Iout[idx] = grey;
    }
}