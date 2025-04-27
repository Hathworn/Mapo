#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Tri_k(float* a, float* b, float* c, float norm, int n)
{
    int tidx = threadIdx.x % n;
    int Qt = threadIdx.x / n;
    int gb_index_x = Qt + blockIdx.x * (blockDim.x / n);

    float normValue = 1.0f / norm; // Pre-compute to save operations
    float commonValue = ((float)tidx + 1.0f) * normValue;

    b[gb_index_x * n + tidx] = commonValue;
    if (tidx == 0) {
        a[gb_index_x * n + tidx] = 0.0f;
    } else if (tidx == n - 1) {
        a[gb_index_x * n + tidx] = commonValue / 3;
        c[gb_index_x * n + tidx] = 0.0f;
    } else {
        a[gb_index_x * n + tidx] = commonValue / 3;
        c[gb_index_x * n + tidx] = commonValue / 3;
    }
}