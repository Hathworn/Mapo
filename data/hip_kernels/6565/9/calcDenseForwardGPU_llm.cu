#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcDenseForwardGPU(float *in, float *out, float *weights, float *biases, int batch_size, int in_size_x, int in_size_y, int in_size_z, int out_size_x, int out_size_y, int out_size_z)
{
    // Compute flattened global thread index
    int id_out = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds for output
    if (id_out < batch_size * out_size_x * out_size_y * out_size_z) {
        int id = id_out;
        int n = id % out_size_x;
        id /= out_size_x;
        id /= out_size_y;
        id /= out_size_z;
        int b = id;

        int w_size_x = in_size_x * in_size_y * in_size_z;
        float sum = 0.0f;

        // Unroll the loop for better performance
        int in_base = b * w_size_x;
        for (int k = 0; k < in_size_z; ++k) {
            for (int j = 0; j < in_size_y; ++j) {
                int offset = (k * in_size_y + j) * in_size_x;
                for (int i = 0; i < in_size_x; ++i) {
                    int m = offset + i;
                    int w_index = n * w_size_x + m;
                    int in_index = in_base + m;

                    // Accumulate dot product
                    sum += in[in_index] * weights[w_index];
                }
            }
        }
        
        // Add bias and store result
        int bias_index = n;
        out[id_out] = sum + biases[bias_index];
    }
}