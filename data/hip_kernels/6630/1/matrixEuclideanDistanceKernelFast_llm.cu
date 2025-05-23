#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

__global__ void matrixEuclideanDistanceKernelFast(float* in, float* out, int n, int m) {
    __shared__ float Ys[16][16];
    __shared__ float Xs[16][16];

    int bx = blockIdx.x, by = blockIdx.y;
    int tx = threadIdx.x, ty = threadIdx.y;

    int yBegin = by * 16 * m;
    int xBegin = bx * 16 * m;

    int yEnd = yBegin + m - 1, y, x, k, o;

    float s = 0.0f; // Initialize s with a consistent floating-point type
    float tmp;

    // Unconditional loop fusion
    for (y = yBegin, x = xBegin; y <= yEnd; y += 16, x += 16) {
        Ys[ty][tx] = in[y + ty * m + tx];
        Xs[tx][ty] = in[x + ty * m + tx];
        __syncthreads();

        // Unroll loop to improve arithmetic intensity
        #pragma unroll // Utilize compiler hints for loop unrolling
        for (k = 0; k < 16; k++) {
            tmp = Ys[ty][k] - Xs[k][tx];
            s += tmp * tmp;
        }
        __syncthreads();
    }

    o = by * 16 * n + ty * n + bx * 16 + tx;
    out[o] = s;
}