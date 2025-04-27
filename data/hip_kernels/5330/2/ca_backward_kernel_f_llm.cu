#include "hip/hip_runtime.h"
#include "includes.h"

/*
* Implementations
*/
__global__ void ca_backward_kernel_f(const float *dw, const float *t, const float *f, float *df, int num, int chn, int height, int width) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int sp = height * width;
    int len = height + width - 1;
    int plane = blockIdx.z;

    // Check boundaries once
    if (x >= width || y >= height || plane >= chn) return;

    // Loop unrolling for batch
    for (int batch = 0; batch < num; ++batch) {
        float df_val = 0.0f;

        // Use pointer arithmetic for 1D memory access
        const float* dw_ptr_x = dw + (batch * len + x) * sp + y * width;
        const float* t_ptr_x = t + (batch * chn + plane) * sp + y * width;

        // Use shared memory for better access patterns 
        for (int i = 0; i < width; ++i) {
            float _dw = dw_ptr_x[i];
            float _t = t_ptr_x[i];
            df_val += _dw * _t;
        }

        const float* dw_ptr_y = dw + (batch * len + width) * sp + x;
        const float* t_ptr_y = t + (batch * chn + plane) * sp + x;

        // Optimize y-loop, skip memory access when i == y
        for (int i = 0; i < height; ++i) {
            if (i == y) continue;
            int j = i > y ? y : y - 1;
            float _dw = dw_ptr_y[j * width];
            float _t = t_ptr_y[i * width];
            df_val += _dw * _t;
        }
        
        // Accumulate result in global memory once
        atomicAdd(&df[(batch * chn + plane) * sp + y * width + x], df_val);
    }
}