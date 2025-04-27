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
        // Compute output coordinates
        int out_x = id % out_size3;
        int out_y = id / out_size3;

        // Compute input coordinates
        int in_x = out_x - (out_size3 - in_size3) / 2;
        int in_y = out_y - (out_size2 - in_size2) / 2;

        // Clamp input coordinates within bounds
        int x = (in_x < 0) ? 0 : ((in_x >= in_size3) ? in_size3 - 1 : in_x);
        int y = (in_y < 0) ? 0 : ((in_y >= in_size2) ? in_size2 - 1 : in_y);

        // Perform the copy
        out[id] = in[y * in_size3 + x];
    }
}