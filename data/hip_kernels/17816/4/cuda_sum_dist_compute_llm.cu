#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_sum_dist_compute(int dy, int dx, int nx, int ny, const int32_t* ones, uint32_t* sum_dist, int p)
{
    int nx0      = blockIdx.x * blockDim.x + threadIdx.x;
    int nxstride = blockDim.x * gridDim.x;
    int dx0      = blockIdx.y * blockDim.y + threadIdx.y;
    int dxstride = blockDim.y * gridDim.y;
    int dy0      = blockIdx.z * blockDim.z + threadIdx.z;
    int dystride = blockDim.z * gridDim.z;

    for(int s = dy0; s < dy; s += dystride)
    {
        for(int d = dx0; d < dx; d += dxstride)
        {
            uint32_t* _sum_dist = sum_dist + (s * nx * ny) + (d * nx);
            const int32_t* _ones = ones + (d * nx);
            
            __shared__ int shared_nx[1024];  // Use shared memory to enhance data locality. Adjust size if necessary.
            int tid = threadIdx.x;
            for (int i = tid; i < nx; i += blockDim.x)  // Cooperative loading of data into shared memory.
            {
                shared_nx[i] = (_ones[i] > 0) ? 1 : 0;
            }
            __syncthreads();  // Synchronize to make sure all shared data is loaded.
            
            for(int n = nx0; n < nx; n += nxstride)
            {
                if (shared_nx[n] > 0)
                {
                    atomicAdd(&_sum_dist[n], 1);
                }
            }
        }
    }
}