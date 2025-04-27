#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    // Utilize shared memory for frequently accessed data
    extern __shared__ float shared_s[];

    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;

    // Load shared memory only if index is within bounds
    if (i < n) shared_s[threadIdx.x] = s[i];

    // Ensure cache consistency
    __syncthreads();

    if (i < n) {
        float Si = shared_s[threadIdx.x];
        float Dci = dc[i];

        if (da) da[i] += Dci * Si;
        if (db) db[i] += Dci * (1 - Si);
        ds[i] += Dci * (a[i] - b[i]);
    }
}