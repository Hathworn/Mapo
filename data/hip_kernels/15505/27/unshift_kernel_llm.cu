#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ void copy_c(float const *in, float *out, int slicesizein, int slicesizeout, int C) {
    // Optimize with loop unrolling
    #pragma unroll
    for (size_t c(0); c < C; ++c)
        out[c * slicesizeout] = in[c * slicesizein];
}

__device__ __forceinline__ void add_c(float const *in, float *out, int slicesizein, int slicesizeout, int C) {
    // Optimize with loop unrolling
    #pragma unroll
    for (size_t c(0); c < C; ++c)
        out[c * slicesizeout] += in[c * slicesizein];
}

__device__ __forceinline__ int get_index(int X, int Y, int Z, int C, int x, int y, int z) {
    return z * (C * X * Y) + y * X + x;
}

__global__ void unshift_kernel(float const *in, float *out, int X, int Y, int C, int dx, int dy, float const beta) {
    int idx = threadIdx.x + blockDim.x * blockIdx.x;       // Compute global index
    int x = idx % X;                                       // Compute x from idx
    int y = idx / X;                                       // Compute y from idx

    int x_to(x + dx), y_to(y + dy);

    if (x >= X || y >= Y || x_to >= X || y_to >= Y || x_to < 0 || y_to < 0)
        return;

    int in_index = get_index(X, Y, 1, C, x_to, y_to, 0);   // Precompute in index
    int out_index = get_index(X, Y, 1, C, x, y, 0);        // Precompute out index

    if (beta > 0)
        add_c(in + in_index, out + out_index, X * Y, X * Y, C);
    else
        copy_c(in + in_index, out + out_index, X * Y, X * Y, C);
}