#include "hip/hip_runtime.h"
#include "includes.h"
#ifdef __cplusplus
extern "C" {
#endif

struct point {
    float x;
    float y;
};

struct point2 {
    double x;
    double y;
};

#ifdef __cplusplus
}
#endif

__global__ void pi_double(const struct point2* A, int* res, const int nbPoint, const float ray) {
    // Calculate global thread index
    const int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;

    // Unrolling factor
    const int unrollFactor = 32;

    // Calculate number of iterations per thread
    const int iterations = (nbPoint + blockDim.x * unrollFactor - 1) / (blockDim.x * unrollFactor);

    #pragma unroll
    for (int i = 0; i < iterations; i++) {
        int idx = globalIdx + blockDim.x * i;
        
        // Boundary check
        if (idx < nbPoint) {
            double distanceSquared = A[idx].x * A[idx].x + A[idx].y * A[idx].y;
            res[idx] = (distanceSquared <= (double)ray);
        }
    }
}