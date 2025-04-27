#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kGenerateTranslationsBigVarOff(float* source, float* target, float* off_x_arr, float* off_y_arr, int source_w, int target_w, int num_channels) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x; // Flatten the thread index
    const unsigned int stride = blockDim.x * gridDim.x; // Calculate total stride

    int pad = (source_w - target_w) / 2;
    int target_tile_size = target_w * target_w;
    int source_tile_size = source_w * source_w;

    int off_x = off_x_arr[blockIdx.x];
    int off_y = off_y_arr[blockIdx.x];

    while (idx < target_tile_size) { // Use 'while' for better loop handling
        int target_x = idx / target_w;
        int target_y = idx % target_w; // Simplify calculation with modulo operator

        int target_index = target_off + target_x * target_w + target_y;
        int source_index = source_off + target_x * source_w + target_y;

        #pragma unroll // Suggest the compiler to unroll the loop
        for (unsigned int ch = 0; ch < num_channels; ch++) {
            target[num_channels * target_index + ch] =
                source[num_channels * source_index + ch];
        }

        idx += stride; // Increment by stride
    }
}