```c
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

__global__ void uplo_exp10 (const int sd, const int unit, const int bottom, const REAL* __restrict__ a, const int offset_a, const int ld_a, REAL* __restrict__ b, const int offset_b, const int ld_b) {
    // Utilize shared memory to reduce global memory accesses
    __shared__ REAL a_shared[blockDim.x][blockDim.y];
    
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;

    if (gid_0 < sd && gid_1 < sd) {
        a_shared[threadIdx.x][threadIdx.y] = a[offset_a + gid_0 + gid_1 * ld_a];
        __syncthreads();  // Ensure all threads have loaded data into shared memory
        
        if ((unit == 132 ? bottom * gid_0 > bottom * gid_1 : bottom * gid_0 >= bottom * gid_1)) {
            b[offset_b + gid_0 + gid_1 * ld_b] = CAST(exp10)(a_shared[threadIdx.x][threadIdx.y]);
        }
    }
}
```
