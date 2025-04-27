#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updhgF_SoA(float *f, float *z1, float *z2, float *g, float tf, float invlambda, int nx, int ny)
{
    int px = blockIdx.x * blockDim.x + threadIdx.x;
    int py = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate global thread index
    int idx = px + py * nx;

    if (px < nx && py < ny)  // Ensure within bounds
    {
        float DIVZ = 0.0f;

        // Use shared memory to enhance data locality and reduce global memory access.
        // Assuming blockDim.x * blockDim.y <= shared memory limit.
        __shared__ float shared_z1[1024], shared_z2[1024];

        int localIdx = threadIdx.y * blockDim.x + threadIdx.x;
        shared_z1[localIdx] = z1[idx];
        shared_z2[localIdx] = z2[idx];

        __syncthreads();

        // Compute the divergence using shared data
        if (px < (nx - 1)) DIVZ += shared_z1[localIdx];
        if (px > 0)        DIVZ -= shared_z1[localIdx - 1];

        if (py < (ny - 1)) DIVZ += shared_z2[localIdx];
        if (py > 0)        DIVZ -= shared_z2[localIdx - blockDim.x];

        __syncthreads();

        // Update f
        f[idx] = (1 - tf) * f[idx] + tf * (g[idx] + invlambda * DIVZ);
    }
}
```
