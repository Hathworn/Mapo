#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bcnn_cuda_axpy_strided_kernel(int n, int num_batches, float a, float *x, float *y, int dst_stride, int src_stride, int x_c, int x_h, int x_w, int y_c, int y_h, int y_w, int min_c, int min_h, int min_w) {
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified calculation of thread id
    if (id >= n) return;

    int i, j, k, b;
    int remainder = id;

    // Unroll divisions to improve performance
    b = remainder / (min_c * min_h * min_w);
    remainder -= b * (min_c * min_h * min_w);
    k = remainder / (min_h * min_w);
    remainder -= k * (min_h * min_w);
    j = remainder / min_w;
    i = remainder % min_w;

    // Precompute common expressions
    int b_offset_y = y_c * b;
    int b_offset_x = x_c * b;

    int dst_int = i * dst_stride + y_w * (j * dst_stride + y_h * (b_offset_y + k));
    int src_ind = i * src_stride + x_w * (j * src_stride + x_h * (b_offset_x + k));

    y[dst_int] += a * x[src_ind];
}