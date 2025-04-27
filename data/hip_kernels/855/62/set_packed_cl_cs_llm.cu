#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_packed_cl_cs(int *d_packed_cl, int *d_packed_cs, int *d_cl, int *d_cs, int *d_gcs, int chunk_num)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread index is within bounds
    if (i < chunk_num) {
        int gcs_diff = d_gcs[i + 1] - d_gcs[i];
        
        // Only proceed if there are entries to pack
        if (gcs_diff > 0) {
            int gcs_index = d_gcs[i];
            
            // Pack cl and cs values
            d_packed_cl[gcs_index] = d_cl[i];
            d_packed_cs[gcs_index] = d_cs[i];
        }
    }
}
```
