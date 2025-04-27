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

__global__ void ge_cbrt(const int sd, const int fd, const REAL* a, const int offset_a, const int ld_a, REAL* b, const int offset_b, const int ld_b) {
    int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Use shared memory for coalesced access (Assume blockDim values)
    __shared__ REAL shared_a[1024];
    if (gid_0 < sd && gid_1 < fd) {
        // Read a into shared memory
        int index_a = offset_a + gid_0 + gid_1 * ld_a;
        shared_a[threadIdx.y * blockDim.x + threadIdx.x] = a[index_a];
        __syncthreads();
        
        // Compute and store result
        int index_b = offset_b + gid_0 + gid_1 * ld_b;
        b[index_b] = CAST(cbrt)(shared_a[threadIdx.y * blockDim.x + threadIdx.x]);
    }
}