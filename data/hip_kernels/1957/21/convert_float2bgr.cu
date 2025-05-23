#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void convert_float2bgr(float* annd, unsigned char* bgr, int w, int h)
{
int x = blockIdx.x*blockDim.x + threadIdx.x;
int y = blockIdx.y*blockDim.y + threadIdx.y;

if (x < w && y < h)
{
int id = y * w + x;
int err = max(min((annd[id] + 1.f), 1.f), 0.f) * 255.f;

bgr[id] = err;
}
}