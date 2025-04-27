#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {

#ifndef REAL
#define REAL float
#endif

#ifndef CAST
#define CAST(fun) fun ## f
#endif

#ifndef REAL2o3
#define REAL2o3 (REAL)0.6666666666666667
#endif

#ifndef REAL3o2
#define REAL3o2 (REAL)1.5
#endif

}

__global__ void uplo_sigmoid (const int sd, const int unit, const int bottom, const REAL* a, const int offset_a, const int ld_a, REAL* b, const int offset_b, const int ld_b) {
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if within bounds and condition meets
    if (gid_0 < sd && gid_1 < sd &&
        ((unit == 132) ? bottom * gid_0 > bottom * gid_1 : bottom * gid_0 >= bottom * gid_1)) {
        
        // Optimized computation
        const int index_a = offset_a + gid_0 + gid_1 * ld_a;
        const int index_b = offset_b + gid_0 + gid_1 * ld_b;
        b[index_b] = CAST(tanh)((REAL)0.5 * a[index_a]) * (REAL)0.5 + (REAL)0.5;
    }
}