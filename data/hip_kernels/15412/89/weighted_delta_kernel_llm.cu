#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds
    if(i < n) {
        float dc_val = dc[i];
        
        if(da) 
            da[i] += dc_val * s[i];
            
        db[i] += dc_val * (1.0f - s[i]);
        ds[i] += dc_val * (a[i] - b[i]);
    }
}
```
