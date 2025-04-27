#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void compact_1D_array(int *input, int *output, int *output_index_array, int array_size) {
    int gid = blockDim.x * blockIdx.x + threadIdx.x;

    // Improved memory access pattern
    if (gid < array_size) {
        int current_index = output_index_array[gid];
        if (gid > 0) {
            int previous_index = output_index_array[gid - 1];
            if (current_index != previous_index) {
                output[current_index] = input[gid - 1];
            }
        } else if (current_index == 0) {
            // Handle the first element case
            output[current_index] = input[gid];
        }
    }
}