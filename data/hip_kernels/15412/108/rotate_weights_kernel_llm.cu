#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void rotate_weights_kernel(const float *src_weight_gpu, float *weight_deform_gpu, int nweights, int n, int kernel_size, int reverse)
{
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    const int kernel_area = kernel_size * kernel_size;
    const int i = index * kernel_area;
    const int stage_step = (nweights / kernel_area) / 4;
    const int stage_id = index / stage_step;

    // Early exit if index is out of bounds
    if (i >= nweights) return;

    // Unroll loops for kernel size to reduce loop overhead
    #pragma unroll
    for (int y = 0; y < kernel_size; ++y) {
        #pragma unroll
        for (int x = 0; x < kernel_size; ++x) {
            const int src_i = x + y * kernel_size + i;
            int dst_i;
            if (stage_id == 0) {
                dst_i = x + y * kernel_size + i; // No rotation
            } else if (stage_id == 1) {
                dst_i = (kernel_size - 1 - y) + x * kernel_size + i; // 90 degree
            } else if (stage_id == 2) {
                dst_i = (kernel_size - 1 - x) + (kernel_size - 1 - y) * kernel_size + i; // 180 degree
            } else { // stage_id == 3
                dst_i = y + (kernel_size - 1 - x) * kernel_size + i; // 270 degree
            }
            if (reverse) {
                weight_deform_gpu[src_i] = src_weight_gpu[dst_i];
            } else {
                weight_deform_gpu[dst_i] = src_weight_gpu[src_i];
            }
        }
    }
}