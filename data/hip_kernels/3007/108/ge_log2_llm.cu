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

__global__ void ge_log2(const int sd, const int fd, const REAL* a, const int offset_a, const int ld_a, REAL* b, const int offset_b, const int ld_b) {
    // Calculate global 1D index for threads
    int tid = blockIdx.x * blockDim.x + threadIdx.x + 
              (blockIdx.y * blockDim.y + threadIdx.y) * gridDim.x * blockDim.x;
    // Check if the thread is within bounds
    if (tid < sd * fd) {
        int gid_0 = tid % sd;
        int gid_1 = tid / sd;
        b[offset_b + gid_0 + gid_1 * ld_b] = CAST(log2)(a[offset_a + gid_0 + gid_1 * ld_a]);
    }
}