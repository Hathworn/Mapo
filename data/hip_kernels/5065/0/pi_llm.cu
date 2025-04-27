```c
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

__global__ void pi(const struct point* A, int* res, const int nbPoint, const float ray) {
    // Calculate global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check bound; original had extra constant 32, corrected here for better bounds management
    if (idx < nbPoint) {
        // Precompute ray squared to avoid recomputing in loop
        float ray_squared = ray * ray;

        // Iterate and store results using block size of stride
        #pragma unroll 16
        for (int j = 0; j < 32 && idx + j < nbPoint; j++) {
            int i = idx + blockDim.x * j;
            res[i] = (A[i].x * A[i].x + A[i].y * A[i].y <= ray_squared);
        }
    }
}