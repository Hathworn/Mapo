#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void calcMaxPoolForwardGPU( float *in,float *out, int in_size_x, int in_size_y, int in_size_z, int batch_size, int out_size_x, int out_size_y, int out_size_z, int stride, int kernel_size )
{
    int id_out = blockIdx.x * blockDim.x + threadIdx.x;

    if (id_out < batch_size * out_size_x * out_size_y * out_size_z) {
        // Precompute indices for better memory coalescing
        int x = id_out % out_size_x;
        int y = (id_out / out_size_x) % out_size_y;
        int z = (id_out / (out_size_x * out_size_y)) % out_size_z;
        int b = id_out / (out_size_x * out_size_y * out_size_z);

        int mapped_x = x * stride;
        int mapped_y = y * stride;

        float mval = -FLT_MAX;  // Use FLT_MAX to ensure it's a known constant
        for (int j = 0; j < kernel_size; ++j) {
            for (int i = 0; i < kernel_size; ++i) {
                // Avoid redundant calculations
                int id_in = b * (in_size_z * in_size_x * in_size_y) +
                            z * (in_size_x * in_size_y) +
                            (mapped_y + j) * in_size_x +
                            (mapped_x + i);

                float v = in[id_in];
                mval = fmaxf(mval, v);  // Use fmaxf for possible performance improvement
            }
        }
        out[id_out] = mval;
    }
}