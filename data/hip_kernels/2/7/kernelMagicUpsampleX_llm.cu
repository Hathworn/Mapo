#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelMagicUpsampleX(float *in, int _w, int _h, float *out) {
    // Coefficients : 1/4, 3/4, 3/4, 1/4 in each direction (doubles the size of the picture)

    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x >= _w || y >= _h)
        return;

    // Duplicate the points at the same place (?)
    out[y * 2 * _w + 2 * x] = in[y * _w + x];

    // Improved boundary checks and computation
    if (x < _w - 1) {
        float left = (x > 0) ? in[y * _w + x - 1] : 0.0f;
        float right = (x < _w - 2) ? in[y * _w + x + 2] : 0.0f;
        out[y * 2 * _w + 2 * x + 1] = __fdividef(3.0f * (in[y*_w + x] + in[y*_w + x + 1]) + left + right, 8.0f);
    }
}