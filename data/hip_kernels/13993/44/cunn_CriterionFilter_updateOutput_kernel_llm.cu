#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_CriterionFilter_updateOutput_kernel(float *target, float *ignored_label, int bound, int batch_size, int map_nelem, int blocks_per_sample)
{
    int sample = blockIdx.x / blocks_per_sample;
    int thread_id = threadIdx.x + (blockIdx.x % blocks_per_sample) * blockDim.x;
    int step = blockDim.x * blocks_per_sample;
    int toffset = sample * map_nelem;
    int ignored_label_num = static_cast<int>(ignored_label[0]);

    // Use thread_id directly for more efficient loop iteration
    for (int i = thread_id; i < map_nelem; i += step) {
        if (target[toffset + i] == ignored_label_num) {
            target[toffset + i] = static_cast<float>(bound + 1);
        }
    }
}