#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

__global__ void matrixEuclideanDistanceKernelFastPartialOut(float* in_X, float* in_Y, float* out, int_least64_t n, int_least64_t m, int_least64_t start_out, int_least64_t end_out) {
    __shared__ float Ys[16][16];
    __shared__ float Xs[16][16];

    int_least64_t bx = blockIdx.x, by = blockIdx.y;
    int_least64_t tx = threadIdx.x, ty = threadIdx.y;

    int_least64_t yBegin = by * 16 * m;
    int_least64_t xBegin = bx * 16 * m;

    int_least64_t yEnd = yBegin + m - 1;
    int_least64_t o = by * 16 * n + ty * n + bx * 16 + tx;

    float s = 0;

    // Loop unrolling for better performance
    for (int_least64_t k = 0; k < m; k += 16) {
        if (k + tx < m && by * 16 + ty < 16) {
            Ys[ty][tx] = in_Y[yBegin + k + ty * m + tx];
            Xs[ty][tx] = in_X[xBegin + k + ty * m + tx];
        }
        __syncthreads();

        #pragma unroll
        for (int_least64_t i = 0; i < 16; i++) {
            float tmp = Ys[ty][i] - Xs[i][tx];
            s += tmp * tmp;
        }
        __syncthreads();
    }

    if (o >= start_out && o < end_out) {
        out[o - start_out] = s;
    }
}