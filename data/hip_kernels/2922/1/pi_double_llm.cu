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

__global__ void pi_double(const struct point2* A, int* res, const int nbPoint, const float ray) {
    const int idx = blockDim.x * blockIdx.x + threadIdx.x;  // Simplified index calculation
    const double raySquared = (double)ray * ray;  // Precompute squared radius
    const int stride = 32 * blockDim.x;  // Define stride

    for (int globalIdx = idx; globalIdx < nbPoint; globalIdx += stride) {  // Global thread stride loop
        int localIdx = globalIdx;
        if (localIdx < nbPoint) {
            res[localIdx] = (A[localIdx].x * A[localIdx].x + A[localIdx].y * A[localIdx].y <= raySquared);
        }
    }
}