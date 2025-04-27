#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunn_TemporalMaxPooling_updateGradInputKernelAtomic(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Calculate offsets to avoid repeated calculations
    int batchOffset = blockIdx.x * input_w * input_n;
    int timeIndex = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;
    int outputOffset = batchOffset + timeIndex * input_n * dW;
    int gradOutputOffset = blockIdx.x * output_w * input_n + timeIndex * input_n;

    // Use shared memory to store indices and gradOutput for coalesced access
    __shared__ float sharedIndices[TEMPORAL_MAX_POOLING_THREADS];
    __shared__ float sharedGradOutput[TEMPORAL_MAX_POOLING_THREADS];

    int feat = threadIdx.x;
    
    if (timeIndex < output_w) {
        // Load values into shared memory
        sharedIndices[feat] = indices[gradOutputOffset + feat];
        sharedGradOutput[feat] = gradOutput[gradOutputOffset + feat];
        __syncthreads();

        // For all features
        for (feat = 0; feat < input_n; ++feat) {
            // Use shared memory for indices and gradOutput
            atomicAdd(&gradInput[outputOffset + (int)sharedIndices[feat] * input_n + feat], sharedGradOutput[feat]);
        }
        __syncthreads();
    }
}