#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NN_UpSampling(float *target, const float *source, const int wt, const int ht)
{
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    if (y < ht && x < wt) {
        int curt = y * wt + x;
        int curs = (y / 2) * (wt / 2) + x / 2;
        // Using registers for temporary storage to minimize memory accesses
        float source_r = source[curs * 3 + 0];
        float source_g = source[curs * 3 + 1];
        float source_b = source[curs * 3 + 2];
        target[curt * 3 + 0] = source_r;
        target[curt * 3 + 1] = source_g;
        target[curt * 3 + 2] = source_b;
    }
}