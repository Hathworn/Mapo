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

        // Precompute the offset values to reduce redundant calculations
        int offset_x = (out_size3 - in_size3) / 2;
        int offset_y = (out_size2 - in_size2) / 2;

        int in_x = out_x - offset_x;
        int in_y = out_y - offset_y;

        // Use clamp to keep values in range for better readability
        int x = max(0, min(in_size3 - 1, in_x));
        int y = max(0, min(in_size2 - 1, in_y));

        out[id] = in[y * in_size3 + x];
    }
}