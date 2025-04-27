#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpuIt3(float *tNew, float *tOld, float *tOrig, int x, int y, int z, float k, float st) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i < x*y*z) {
        float center = tOld[i];
        float front = (i >= x*y) ? tOld[i - x*y] : center;
        float back = (i < x*y*(z-1)) ? tOld[i + x*y] : center;
        float top = (i >= x) ? tOld[i - x] : center;
        float bottom = (i < x*y*z - x) ? tOld[i + x] : center;
        float left = (i % x > 0) ? tOld[i - 1] : center;
        float right = (i % x < x-1) ? tOld[i + 1] : center;

        // Compute the new temperature value
        tNew[i] = center + k * (front + back + top + bottom + left + right - 6 * center);

        // Replace with original stability value if not a heat source
        if (tOrig[i] != st) {
            tNew[i] = tOrig[i];
        }
    }
}