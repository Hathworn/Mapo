#include "hip/hip_runtime.h"
#include "includes.h"

#define PI 3.1415926536f

int MaxThreadsPerBlock;
int MaxThreadsX;
int MaxThreadsY;

__global__ void FillTex(void *surface, int width, int height, size_t pitch, double* src, int Mask)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure thread does not access out-of-bounds memory
    if (x >= width || y >= height) return;

    double w = src[x + width * y];
    unsigned char *pixel1 = (unsigned char *)((char*)surface + y * pitch) + 4 * x;

    // Clamping w value within range [0, 253]
    w = min(max(w, 0.0), 253.0);

    #pragma unroll
    for (int i = 0; i < 4; i++) {
        if (Mask & (1 << i)) {
            pixel1[i] = (unsigned char)w;
        }
    }
}