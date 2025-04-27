#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcRouteForwardGPU(float *in, float *out, int in_size_x, int in_size_y, int in_size_z, int z_offset, int elements)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < elements) {
        int id_in = id;

        // Precompute multiplication factors
        int area = in_size_x * in_size_y;
        int volume = area * in_size_z;

        // Optimize division and modulus operations
        int x = id % in_size_x;
        int rem = id / in_size_x;
        int y = rem % in_size_y;
        rem /= in_size_y;
        int z = rem % in_size_z;
        int b = rem / in_size_z;

        int id_out = b * volume + (z + z_offset) * area + y * in_size_x + x;
        out[id_out] = in[id_in];
    }
}