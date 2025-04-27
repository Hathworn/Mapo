#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ void copy_c(float const *in, float *out, int slicesizein, int slicesizeout, int C) {
    // Optimize inner loop by using pragma unroll
    #pragma unroll
    for (size_t c = 0; c < C; ++c)
        out[c * slicesizeout] = in[c * slicesizein];
}

__device__ __forceinline__ void add_c(float const *in, float *out, int slicesizein, int slicesizeout, int C) {
    // Optimize inner loop by using pragma unroll
    #pragma unroll
    for (size_t c = 0; c < C; ++c)
        out[c * slicesizeout] += in[c * slicesizein];
}

__device__ __forceinline__ int get_index(int X, int Y, int Z, int C, int x, int y, int z) {
    return z * (C * X * Y) + y * X + x;
}

__global__ void shift_kernel(float const *in, float *out, int X, int Y, int C, int dx, int dy, float const beta) {
    // Optimize index calculation through shared memory
    extern __shared__ int sharedIdx[];
    int tid = threadIdx.x + blockDim.x * blockIdx.x;
    int x = tid % X;
    int y = tid / X;

    if (x >= X || y >= Y) return;

    int x_to = x + dx;
    int y_to = y + dy;

    if (x_to < 0 || x_to >= X || y_to < 0 || y_to >= Y) return;

    float const *in_ptr = in + get_index(X, Y, 1, C, x, y, 0);
    float *out_ptr = out + get_index(X, Y, 1, C, x_to, y_to, 0);

    if (beta > 0) {
        add_c(in_ptr, out_ptr, X * Y, X * Y, C);
    } else {
        copy_c(in_ptr, out_ptr, X * Y, X * Y, C);
    }
}