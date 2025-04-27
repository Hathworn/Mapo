#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelScharrX( float const *in, int _w, int _h, float *out) {
    int x = blockIdx.x*blockDim.x + threadIdx.x;
    int y = blockIdx.y*blockDim.y + threadIdx.y;

    if(x >= _w || y >= _h) return;

    int a = max(y-1, 0);
    int b = y;
    int c = min(y+1, _h -1);

    int i1 = max(x-1, 0);
    int i3 = min(x+1, _w-1);

    // Precompute repeated index calculations
    int a1 = a * _w + i1;
    int a3 = a * _w + i3;
    int b1 = b * _w + i1;
    int b3 = b * _w + i3;
    int c1 = c * _w + i1;
    int c3 = c * _w + i3;

    // Optimize calculation by avoiding repetitive computation
    float in_a1 = in[a1], in_c1 = in[c1], in_a3 = in[a3], in_c3 = in[c3], in_b3 = in[b3], in_b1 = in[b1];
    out[y * _w + x] = __fdividef(3.0f * (-in_a1 - in_c1 + in_a3 + in_c3) + 10.0f * (in_b3 - in_b1), 20.0f);
}