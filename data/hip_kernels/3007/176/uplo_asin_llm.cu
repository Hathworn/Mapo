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

__global__ void uplo_asin(const int sd, const int unit, const int bottom, const REAL* a, const int offset_a, const int ld_a, REAL* b, const int offset_b, const int ld_b) {
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;
    // Use shared memory to reduce global memory accesses
    __shared__ REAL shared_a[1024];

    const int tid = threadIdx.x + threadIdx.y * blockDim.x;
    if (tid < sd * sd) {
        shared_a[tid] = a[offset_a + tid];
    }
    __syncthreads();

    const bool valid = (gid_0 < sd) && (gid_1 < sd);
    const bool check = valid &&
        ((unit == 132) ? bottom * gid_0 > bottom * gid_1 : bottom * gid_0 >= bottom * gid_1);

    if (check) {
        // Optimize using pre-loaded shared memory
        b[offset_b + gid_0 + gid_1 * ld_b] = CAST(asin)(shared_a[gid_0 + gid_1 * ld_a]);
    }
}