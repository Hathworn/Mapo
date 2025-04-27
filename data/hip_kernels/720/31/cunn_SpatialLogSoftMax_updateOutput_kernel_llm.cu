#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_SpatialLogSoftMax_updateOutput_kernel(float *output, float *input, int feature_size, int spatial_size, int data_size, float constant)
{
    int idx = threadIdx.x + blockDim.x * blockIdx.x;
    idx = (idx / spatial_size) * feature_size + idx % spatial_size;

    if (idx < data_size) {
        int next_idx = idx + feature_size;
        float logsum = 0.0f;
        float max = -FLT_MAX; // Use predefined constant for min float value

        // Use shared memory to improve access speed
        __shared__ float s_input[1024]; // Adjust size if needed based on block size
        __shared__ float s_max;

        // Load input into shared memory
        for (int i = idx; i < next_idx; i += spatial_size) {
            if (threadIdx.x == 0) {
                s_max = max;
            }
            __syncthreads();

            // Find max in a parallel reduction
            
            atomicMax(&s_max, input[i]);

            __syncthreads();
            max = s_max; // Update max

            if (isnan(input[i])) continue;

            // Accumulate logsum using shared memory
            if (threadIdx.x == 0) {
                s_input[i % 1024] = __expf(input[i] - max);
            }
            atomicAdd(&logsum, s_input[i % 1024]);
        }

        logsum += constant;
        logsum = __logf(logsum) + max;

        // Compute logsoftmax
        for (int i = idx; i < next_idx; i += spatial_size) {
            output[i] = input[i] - logsum;
        }
    }
}