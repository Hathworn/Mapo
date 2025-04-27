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

__global__ void uplo_linear_frac (const int sd, const int unit, const int bottom, const REAL* a, const int offset_a, const int ld_a, const REAL* b, const int offset_b, const int ld_b, const REAL scalea, const REAL shifta, const REAL scaleb, const REAL shiftb, REAL* c, const int offset_c, const int ld_c) {
    // Compute global indices
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if threads are within bounds
    if ((gid_0 < sd) && (gid_1 < sd)) {
        // Determine if computation is necessary based on 'unit' and 'bottom' values
        bool condition = (unit == 132) ? bottom * gid_0 > bottom * gid_1 : bottom * gid_0 >= bottom * gid_1;
        
        // Perform computation if condition is met
        if (condition) {
            int idx = gid_0 + gid_1 * ld_a; // Compute index once for reuse
            c[offset_c + gid_0 + gid_1 * ld_c] =
                (scalea * a[offset_a + idx] + shifta) /
                (scaleb * b[offset_b + idx] + shiftb);
        }
    }
}