#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_convert(uchar3* d_Iin, float4* d_Iout, int numel) {
    // Calculate global thread index
    size_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread index is within bounds
    if (idx < numel) {
        uchar3 val = d_Iin[idx];
        
        // Convert and store in the output array
        d_Iout[idx] = make_float4(
            val.x * 0.00392156862f, // Pre-compute 1/255.0f for efficiency
            val.y * 0.00392156862f,
            val.z * 0.00392156862f,
            1.0f
        );
    }
}