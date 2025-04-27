#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcConvolutionForwardPaddedInGPU(float *in, float *padded_in, int batch_size, int in_size_x, int in_size_y, int in_size_z, int padding) 
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified ID calculation

    if (id < batch_size * in_size_x * in_size_y * in_size_z) {
        int temp_id = id;  // Use a temporary variable for calculations
        int x = temp_id % in_size_x;
        temp_id /= in_size_x;
        int y = temp_id % in_size_y;
        temp_id /= in_size_y;
        int z = temp_id % in_size_z;
        temp_id /= in_size_z;
        int b = temp_id;

        // Pre-calculate padding offset to reduce per-thread computation
        int pad_x_size = in_size_x + 2 * padding;
        int pad_y_size = in_size_y + 2 * padding;

        int pad_index = b * (in_size_z * pad_x_size * pad_y_size) +
                        z * (pad_x_size * pad_y_size) +
                        (y + padding) * pad_x_size +
                        (x + padding);

        padded_in[pad_index] = in[id];  // Use original id for direct access
    }
}