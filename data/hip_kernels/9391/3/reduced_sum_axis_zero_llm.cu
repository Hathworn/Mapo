#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel for better performance
__global__ void reduced_sum_axis_zero(const float *input_data, float *output_data, int input_n, int output_n) {
    // Calculate global index
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    // Use shared memory to optimize access
    extern __shared__ float shared_sum[];
    
    if (idx < output_n) {
        float sum = 0.0f;
        // Unroll the loop to increase efficiency
        for (int i = idx; i < input_n; i += output_n) {
            sum += input_data[i];
        }
        shared_sum[threadIdx.x] = sum;
        
        // Use intra-block reduction
        __syncthreads();
        
        for (int s = blockDim.x / 2; s > 0; s >>= 1) {
            if (threadIdx.x < s) {
                shared_sum[threadIdx.x] += shared_sum[threadIdx.x + s];
            }
            __syncthreads();
        }
        
        // Only the first thread writes back the result
        if (threadIdx.x == 0) {
            output_data[blockIdx.x] = shared_sum[0];
        }
    }
}