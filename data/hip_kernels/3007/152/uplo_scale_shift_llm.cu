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

__global__ void uplo_scale_shift (const int sd, const int unit, const int bottom, const REAL* a, const int offset_a, const int ld_a, const REAL scalea, const REAL shifta, const REAL scaleb, const REAL shiftb, REAL* c, const int offset_c, const int ld_c) {
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;

    if (gid_0 >= sd || gid_1 >= sd) return; // Early exit if out of bounds

    const bool check = 
    (unit == 132) ? bottom * gid_0 > bottom * gid_1 : bottom * gid_0 >= bottom * gid_1;
    
    if (check) {
        const int index_a = offset_a + gid_0 + gid_1 * ld_a;
        const int index_c = offset_c + gid_0 + gid_1 * ld_c;
        
        // Computation with pre-calculated indices
        c[index_c] = scalea * a[index_a] + shifta;
    }
}
}