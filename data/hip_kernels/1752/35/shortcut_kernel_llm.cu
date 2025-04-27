#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float *out)
{
    // Calculate global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int total_threads = gridDim.x * blockDim.x;

    // Use loop to parallelize for more work if thread count is less than size
    for (int idx = id; idx < size; idx += total_threads) {
        int i = idx % minw;
        int idx_temp = idx / minw;
        int j = idx_temp % minh;
        idx_temp /= minh;
        int k = idx_temp % minc;
        idx_temp /= minc;
        int b = idx_temp % batch;

        // Calculate indexes for input and output arrays
        int out_index = i * sample + w2 * (j * sample + h2 * (k + c2 * b));
        int add_index = i * stride + w1 * (j * stride + h1 * (k + c1 * b));

        // Perform addition
        out[out_index] += add[add_index];
    }
}