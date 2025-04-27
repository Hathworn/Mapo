#include "hip/hip_runtime.h"
#include "includes.h"

#define TB 128
#define DISP_MAX 256

__global__ void copy_fill(float *in, float *out, int size, int in_size2, int in_size3, int out_size2, int out_size3)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (id >= size) return; // Exit early if thread ID is out of bounds

    int out_x = id % out_size3;
    int out_y = id / out_size3;

    int in_x = out_x - (out_size3 - in_size3) / 2;
    int in_y = out_y - (out_size2 - in_size2) / 2;

    // Clamp coordinates to avoid branch divergence
    in_x = max(0, min(in_size3 - 1, in_x));
    in_y = max(0, min(in_size2 - 1, in_y));

    out[id] = in[in_y * in_size3 + in_x];
}