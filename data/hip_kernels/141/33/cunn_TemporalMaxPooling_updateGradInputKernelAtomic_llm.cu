```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_TemporalMaxPooling_updateGradInputKernelAtomic(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) 
{
    // Calculate global index based on block and thread indices
    int globalIndex = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;
    
    // Return early if the global index exceeds or equals output_w
    if (globalIndex >= output_w) return;

    // Calculate offset for each data pointer
    int outputOffset = blockIdx.x * output_w * input_n + globalIndex * input_n;
    int inputOffset = blockIdx.x * input_w * input_n + globalIndex * input_n * dW;

    gradInput += inputOffset;
    gradOutput += outputOffset;
    indices += outputOffset;

    // Iterate over features and perform atomic addition
    for (int feat = 0; feat < input_n; ++feat) {
        atomicAdd(&gradInput[(int)indices[feat] * input_n + feat], gradOutput[feat]);
    }
}