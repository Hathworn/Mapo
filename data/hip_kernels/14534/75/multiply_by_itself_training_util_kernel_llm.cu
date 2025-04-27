#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multiply_by_itself_training_util_kernel(const float4 *__restrict input_buf, float4 *__restrict output_buf, int elem_count) {
    int elem_id = blockDim.x * blockIdx.x + threadIdx.x;

    // Use warp-shuffle optimization to reduce divergent branches
    if (elem_id < elem_count) {
        float4 val = input_buf[elem_id];
        float4 result;
        
        result.x = val.x * val.x; // Compute x squared
        result.y = val.y * val.y; // Compute y squared
        result.z = val.z * val.z; // Compute z squared
        result.w = val.w * val.w; // Compute w squared
        
        output_buf[elem_id] = result;
    }
}