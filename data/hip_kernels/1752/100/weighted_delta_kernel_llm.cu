#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    // Calculate global index
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;

    // Ensure valid index within bounds
    if (i < n) {
        // Use shared memory for quick access to s[i] value (if applicable)
        float shared_s_i = s[i];  // Store s[i] in a temporary register

        // Update da if pointer is non-null
        if (da) da[i] += dc[i] * shared_s_i;

        // Update db if pointer is non-null
        if (db) db[i] += dc[i] * (1 - shared_s_i);

        // Update ds with the difference between a[i] and b[i]
        ds[i] += dc[i] * (a[i] - b[i]);
    }
}