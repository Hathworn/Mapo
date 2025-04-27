#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void zupdate2_SoA(float *z1, float *z2, float *f, float tau, int nx, int ny)
{
    int px = blockIdx.x * blockDim.x + threadIdx.x;
    int py = blockIdx.y * blockDim.y + threadIdx.y;

    // Use shared memory for improved access speed
    __shared__ float s_f[32][32];  

    // Check for boundary conditions
    if (px < nx && py < ny)
    {
        int idx = px + py * nx;

        // Load the shared memory
        s_f[threadIdx.y][threadIdx.x] = f[idx];
        __syncthreads();

        float a = 0.0f, b = 0.0f;

        int rightIdx = (px < nx - 1) ? threadIdx.x + 1 : threadIdx.x;
        int upIdx = (py < ny - 1) ? threadIdx.y + 1 : threadIdx.y;

        // Use shared memory values for computation
        if (px < (nx - 1)) a = s_f[threadIdx.y][rightIdx] - s_f[threadIdx.y][threadIdx.x];
        if (py < (ny - 1)) b = s_f[upIdx][threadIdx.x] - s_f[threadIdx.y][threadIdx.x];

        // Efficient computation of sqrt and update z values
        float norm = rsqrtf(1.0f + tau * sqrtf(a * a + b * b));
        z1[idx] = (z1[idx] + tau * a) * norm;
        z2[idx] = (z2[idx] + tau * b) * norm;
    }
}