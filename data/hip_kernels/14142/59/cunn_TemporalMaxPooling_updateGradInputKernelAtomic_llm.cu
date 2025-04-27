#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunn_TemporalMaxPooling_updateGradInputKernelAtomic(float *gradInput, float *gradOutput, float *indices, int input_w, int input_n, int output_w, int kW, int dW) {
    // Calculate data pointer offsets once outside the loop
    int threadIndex = threadIdx.x + blockIdx.y * TEMPORAL_MAX_POOLING_THREADS;
    if (threadIndex >= output_w) return; // Terminate if index is out-of-bounds

    // Pre-calculate pointers
    float *gradInput_data = gradInput + blockIdx.x * input_w * input_n + threadIndex * input_n * dW;
    float *gradOutput_data = gradOutput + blockIdx.x * output_w * input_n + threadIndex * input_n;
    float *indices_data = indices + blockIdx.x * output_w * input_n + threadIndex * input_n;

    // Parallelize feature updates using thread parallelism
    for (int feat = threadIdx.y; feat < input_n; feat += blockDim.y) {
        atomicAdd(&gradInput_data[(int)indices_data[feat] * input_n + feat], gradOutput_data[feat]);
    }
}