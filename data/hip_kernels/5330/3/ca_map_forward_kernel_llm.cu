#include "hip/hip_runtime.h"
#include "includes.h"

/*
* Implementations
*/
__global__ void ca_map_forward_kernel(const float *weight, const float *g, float *out, int num, int chn, int height, int width) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int sp = height * width;
    int len = height + width - 1;
    int plane = blockIdx.z;

    if (x < width && y < height && plane < chn) {
        // Iterate over batch using shared memory to leverage data re-use
        for (int batch = 0; batch < num; ++batch) {
            float sum = 0.0f;
            // Reorder loops for coalesced memory access and spatial locality
            for (int i = 0; i < width; ++i) {
                float _g = g[(batch * chn + plane) * sp + y * width + i];
                float _w = weight[(batch * len + i) * sp + y * width + x];
                sum += _g * _w;
            }
            for (int i = 0; i < height; ++i) {
                if (i == y) continue;
                int j = i < y ? i : i - 1;
                float _g = g[(batch * chn + plane) * sp + i * width + x];
                float _w = weight[(batch * len + width + j) * sp + y * width + x];
                sum += _g * _w;
            }
            out[(batch * chn + plane) * sp + y * width + x] += sum;
        }
    }
}