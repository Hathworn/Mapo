#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kGenerateTranslationsBigVarOff(float* source, float* target, float* off_x_arr, float* off_y_arr, int source_w, int target_w, int num_channels) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x; // Use global thread index
    const unsigned int numThreads = gridDim.x * blockDim.x; // Total number of threads

    int pad = (source_w - target_w) / 2;
    int target_tile_size = target_w * target_w;
    int source_tile_size = source_w * source_w;

    int off_x = off_x_arr[blockIdx.x];
    int off_y = off_y_arr[blockIdx.x];
    int target_off = blockIdx.x * target_tile_size;
    int source_off = blockIdx.x * source_tile_size + (pad + off_x) * source_w + (pad + off_y);

    for (unsigned int target_ind = idx; target_ind < target_tile_size; target_ind += numThreads) {
        int target_x = target_ind / target_w;
        int target_y = target_ind % target_w; // Optimize modulus operation

        int target_idx_base = target_off + target_x * target_w + target_y;
        int source_idx_base = source_off + target_x * source_w + target_y;

        for (unsigned int ch = 0; ch < num_channels; ch++) {
            target[num_channels * target_idx_base + ch] = source[num_channels * source_idx_base + ch];
        }
    }
}