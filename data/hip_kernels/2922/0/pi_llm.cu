#include "hip/hip_runtime.h"
#include "includes.h"
#ifdef __cplusplus
extern "C" {
#endif

struct point{
float x;
float y;
};

struct point2{
double x;
double y;
};

#ifdef __cplusplus
}
#endif
__global__ void pi(const struct point* A, int* res, const int nbPoint, const float ray) {
    const int idx_start = 32 * blockIdx.x * blockDim.x + threadIdx.x;
    const int stride = blockDim.x * 32;
    int idx = idx_start;

    // Loop unrolling for performance
    #pragma unroll 16
    for (int j = 0; j < 32 && idx < nbPoint; j++, idx += blockDim.x) {
        float ax = A[idx].x;
        float ay = A[idx].y;
        res[idx] = (ax * ax + ay * ay <= ray);
    }
}