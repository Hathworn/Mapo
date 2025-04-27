#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelScharrY(float const *in, int _w, int _h, float *out)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure within bounds
    if (x >= _w || y >= _h)
        return;

    // Calculate row indices with boundary checks
    int a = max(y - 1, 0);
    int c = min(y + 1, _h - 1);

    // Calculate column indices with boundary checks
    int i1 = max(x - 1, 0);
    int i3 = min(x + 1, _w - 1);

    // Compute linear indices
    int a1 = a * _w + i1;
    int a2 = a * _w + x;
    int a3 = a * _w + i3;
    int c1 = c * _w + i1;
    int c2 = c * _w + x;
    int c3 = c * _w + i3;

    // Simplified arithmetic calculation
    float val = -in[a1] - in[a3] + in[c1] + in[c3];
    val = fmaf(10.0f, in[c2] - in[a2], val); // Fused multiply-add
    out[y * _w + x] = val * 0.05f; // Equivalent to division by 20.0
}