#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

__global__ void matrixEuclideanDistanceKernelFastPartialOut(float* in, float* out, int_least64_t n, int_least64_t m, int_least64_t start_out, int_least64_t end_out) {
    __shared__ float Ys[16][16];
    __shared__ float Xs[16][16];
    
    int_least64_t bx = blockIdx.x, by = blockIdx.y;
    int_least64_t tx = threadIdx.x, ty = threadIdx.y;

    int_least64_t yBegin = by * 16 * m;
    int_least64_t xBegin = bx * 16 * m;
    
    int_least64_t yEnd = yBegin + m - 1;
    float s = 0.0f;

    // Loop updated to fetch elements efficiently
    for (int_least64_t y = yBegin, x = xBegin; y <= yEnd; y += 16, x += 16) {
        Ys[ty][tx] = in[y + ty * m + tx];
        Xs[tx][ty] = in[x + ty * m + tx];
        __syncthreads();
        
        // Minimize index calculations inside the loop
        #pragma unroll
        for (int_least64_t k = 0; k < 16; ++k) {
            float diff = Ys[ty][k] - Xs[k][tx];
            s += diff * diff;
        }
        __syncthreads();
    }

    // Calculate output index and conditional check
    int_least64_t o = by * 16 * n + ty * n + bx * 16 + tx;
    if (o >= start_out && o < end_out) {
        out[o - start_out] = s;
    }
}