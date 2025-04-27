#include "hip/hip_runtime.h"
#include "includes.h"

/*
* Implementations
*/
__global__ void ca_backward_kernel_t(const float *dw, const float *t, const float *f, float *dt, int num, int chn, int height, int width) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int sp = height * width;
    int len = height + width - 1;
    int plane = blockIdx.z;

    if (x < width && y < height && plane < chn) {
        for (int batch = 0; batch < num; ++batch) {
            float dt_update = 0.0f;

            // Combine the two loops into one, reducing memory accesses and improving thread coherence
            for (int i = 0; i < width + height - 1; ++i) {
                if (i < width) {
                    float _dw = dw[(batch * len + i) * sp + y * width + x];
                    float _f = f[(batch * chn + plane) * sp + y * width + i];
                    dt_update += _dw * _f;
                }
                if (i >= width) {
                    int h_idx = i - width;
                    if (h_idx == y) continue;
                    int j = (h_idx < y) ? h_idx : h_idx - 1;

                    float _dw = dw[(batch * len + width + j) * sp + y * width + x];
                    float _f = f[(batch * chn + plane) * sp + h_idx * width + x];
                    dt_update += _dw * _f;
                }
            }
            dt[(batch * chn + plane) * sp + y * width + x] += dt_update;
        }
    }
}