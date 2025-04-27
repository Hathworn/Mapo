#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_kernel(float *x, int n, int w, int h, int c, int size, float rate, float *delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Flatten block and thread IDs into a single ID
    if (id >= n) return;

    int j = id % w;
    int i = (id / w) % h;  
    int k = (id / (w * h)) % c;
    int b = id / (w * h * c);

    int half_size = size / 2;  // Precalculate half of size for offset
    int out_index = j + w * (i + h * (k + c * b));  // Pre-calculate output index

    float sum = 0;  // Accumulator for delta calculation

    for (int l = -half_size; l <= half_size; ++l) {
        for (int m = -half_size; m <= half_size; ++m) {
            int cur_h = i + l;
            int cur_w = j + m;
            if (cur_h >= 0 && cur_h < h && cur_w >= 0 && cur_w < w) {  // Boundary check
                int index = cur_w + w * (cur_h + h * (k + b * c));  // Calculate index for x
                sum += rate * (x[index] - x[out_index]);  // Update sum with valid values
            }
        }
    }
    delta[out_index] += sum;  // Assign accumulated sum to delta
}