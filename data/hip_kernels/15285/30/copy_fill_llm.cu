#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define TB 128

#define DISP_MAX 256

__global__ void copy_fill(float *in, float *out, int size, int in_size2, int in_size3, int out_size2, int out_size3)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < size) {
        int out_x = id % out_size3;
        int out_y = id / out_size3;

        // Calculate in_x and in_y once to reduce operation counts
        int in_x_offset = (out_size3 - in_size3) / 2;
        int in_y_offset = (out_size2 - in_size2) / 2;

        // Use clamp to handle boundaries and simplify logic
        int x = min(in_size3 - 1, max(0, out_x - in_x_offset));
        int y = min(in_size2 - 1, max(0, out_y - in_y_offset));

        // Directly perform the memory copy using calculated indices
        out[id] = in[y * in_size3 + x];
    }
}