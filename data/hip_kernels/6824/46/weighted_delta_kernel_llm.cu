#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a stride loop to handle cases where threads exceed `n`
    for (int stride = i; stride < n; stride += blockDim.x * gridDim.x) {
        if(da) da[stride] += dc[stride] * s[stride];  // Update `da` if not null
        if(db) db[stride] += dc[stride] * (1 - s[stride]);  // Update `db` if not null
        ds[stride] += dc[stride] * (a[stride] - b[stride]);  // Always update `ds`
    }
}