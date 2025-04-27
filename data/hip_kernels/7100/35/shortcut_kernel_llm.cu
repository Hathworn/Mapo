#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float *out)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride_grid = blockDim.x * gridDim.x;  // Calculate grid stride

    for (; id < size; id += stride_grid) {
        int temp_id = id;
        int i = temp_id % minw;  // Calculate the index for w1 dimension
        temp_id /= minw;
        int j = temp_id % minh;  // Calculate the index for h1 dimension
        temp_id /= minh;
        int k = temp_id % minc;  // Calculate the index for c1 dimension
        temp_id /= minc;
        int b = temp_id % batch; // Calculate the index for batch dimension

        int out_index = i * sample + w2 * (j * sample + h2 * (k + c2 * b));       // Calculate the out index
        int add_index = i * stride + w1 * (j * stride + h1 * (k + c1 * b));       // Calculate the add index
        out[out_index] += add[add_index];  // Update out with add value
    }
}
```
