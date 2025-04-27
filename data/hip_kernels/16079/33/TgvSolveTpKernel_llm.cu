#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TgvSolveTpKernel(float *a, float *b, float *c, float2 *p, float2 *Tp, int width, int height, int stride) {
    int ix = blockIdx.x * blockDim.x + threadIdx.x;     // current column
    int iy = blockIdx.y * blockDim.y + threadIdx.y;     // current row
    
    if ((ix < width) && (iy < height)) {                // ensure within bounds
        int pos = ix + iy * stride;

        float px = p[pos].x;
        float py = p[pos].y;
        // Reduce memory access by storing values into registers
        Tp[pos].x = a[pos] * px + c[pos] * py;
        Tp[pos].y = c[pos] * px + b[pos] * py;
    }
}