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

__global__ void ge_tan(const int sd, const int fd, const REAL* a, const int offset_a, const int ld_a, REAL* b, const int offset_b, const int ld_b) {
    // Calculate global index for current thread
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if thread is within bounds
    if (gid_0 < sd && gid_1 < fd) {
        // Use shared memory to store intermediate values
        extern __shared__ REAL shared_a[];
        const int local_idx = threadIdx.y * blockDim.x + threadIdx.x;
        shared_a[local_idx] = a[offset_a + gid_0 + gid_1 * ld_a];

        // Synchronize threads in the block
        __syncthreads();

        // Write result
        b[offset_b + gid_0 + gid_1 * ld_b] = CAST(tan)(shared_a[local_idx]);
    }
}