#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_inverse_array_kernel(const float *src_gpu, float *dst_gpu, int size, const float eps)
{
    // Calculate the index based on block and thread dimensions
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (index < size) {
        float val = src_gpu[index];
        float sign = (val < 0) ? -1 : 1;
        
        // Use a more efficient way to compute absolute value and powf in single step
        dst_gpu[index] = __powf(fabs(val), eps) * sign;  // Optimize powf calculation
    }
}