#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduce_and_expand_array_kernel(const float *src_gpu, float *dst_gpu, int current_size, int groups)
{
    const int index = blockIdx.x * blockDim.x + threadIdx.x;

    if (index < current_size) {
        float val = 0;
        
        // Unroll the reduction loop for better performance.
        for (int i = 0; i < groups; i += 2) {
            val += src_gpu[index + i * current_size];
            if (i + 1 < groups) {
                val += src_gpu[index + (i + 1) * current_size];
            }
        }
        
        // Compute the average
        val /= groups;

        // Use a single loop for the expansion step.
        for (int i = 0; i < groups; ++i) {
            dst_gpu[index + i * current_size] = val;
        }
    }
}