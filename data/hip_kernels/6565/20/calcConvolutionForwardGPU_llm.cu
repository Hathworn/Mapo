#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcConvolutionForwardGPU(float *out, float *padded_in, float *filters, int padded_in_size_x, int padded_in_size_y, int padded_in_size_z, int batch_size, int out_size_x, int out_size_y, int out_size_z, int kernel_size, int stride, int filter_size)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread indexing
    int id_out = id;

    if (id_out < batch_size * out_size_x * out_size_y * out_size_z) {
        int x = id_out % out_size_x;
        int y = (id_out / out_size_x) % out_size_y;
        int filter = (id_out / (out_size_x * out_size_y)) % out_size_z;
        int b = id_out / (out_size_x * out_size_y * out_size_z);

        int mapped_x = x * stride;
        int mapped_y = y * stride;

        float sum = 0.0f;
        for (int z = 0; z < padded_in_size_z; ++z) {
            for (int j = 0; j < kernel_size; ++j) {
                for (int i = 0; i < kernel_size; ++i) {

                    int padded_in_index = b * (padded_in_size_x * padded_in_size_y * padded_in_size_z)
                                          + z * (padded_in_size_x * padded_in_size_y)
                                          + (mapped_y + j) * padded_in_size_x + (mapped_x + i);
                    int filter_index = z * (kernel_size * kernel_size) + j * kernel_size + i;

                    sum += filters[filter * filter_size + filter_index] * padded_in[padded_in_index];
                }
            }
        }
        out[id_out] = sum;
    }
}