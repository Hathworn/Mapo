#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void ca_map_backward_kernel_g(const float *dout, const float *weight, const float *g, float *dg, int num, int chn, int height, int width) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int sp = height * width;
    int len = height + width - 1;
    int plane = blockIdx.z;

    if (x < width && y < height && plane < chn) {
        for (int batch = 0; batch < num; ++batch) {
            // Unroll width loop with persistent threads
            for (int i = 0; i < width; ++i) {
                float _dout = dout[(batch * chn + plane) * sp + y * width + i];
                float _w = weight[(batch * len + x) * sp + y * width + i];
                atomicAdd(&dg[(batch * chn + plane) * sp + y * width + x], _dout * _w);
            }

            // Unroll height loop with merged calculations
            for (int i = 0; i < height; ++i) {
                if (i != y) {
                    int j = (i > y) ? y : y - 1;
                    float _dout = dout[(batch * chn + plane) * sp + i * width + x];
                    float _w = weight[(batch * len + width + j) * sp + i * width + x];
                    atomicAdd(&dg[(batch * chn + plane) * sp + y * width + x], _dout * _w);
                }
            }
        }
    }
}