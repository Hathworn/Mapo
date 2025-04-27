#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void HessianPositiveDefiniteKernel( char *d_hessian_pd, float *d_Src, int imageW, int imageH, int imageD )
{
    __shared__ float s_Data[HES_BLOCKDIM_Z+2][HES_BLOCKDIM_Y+2][(HES_RESULT_STEPS + 2 * HES_HALO_STEPS) * HES_BLOCKDIM_X];

    // Calculate thread's base coordinates in the grid
    const int baseX = (blockIdx.x * HES_RESULT_STEPS - HES_HALO_STEPS) * HES_BLOCKDIM_X + threadIdx.x;
    const int baseY = blockIdx.y * HES_BLOCKDIM_Y + threadIdx.y - 1;
    const int baseZ = blockIdx.z * HES_BLOCKDIM_Z + threadIdx.z - 1;
    const int idx = (baseZ * imageH + baseY) * imageW + baseX;

    d_Src += idx;  
    d_hessian_pd += idx;

    // Check if thread is within the valid working section
    if(baseZ < 0 || baseZ >= imageD || baseY < 0 || baseY >= imageH) {
        for (int i = 0; i < HES_HALO_STEPS + HES_RESULT_STEPS + HES_HALO_STEPS; i++) {
            s_Data[threadIdx.z][threadIdx.y][threadIdx.x + i * HES_BLOCKDIM_X] = 0;
        }
        return;
    }

    // Load main data into shared memory
    #pragma unroll
    for (int i = HES_HALO_STEPS; i < HES_HALO_STEPS + HES_RESULT_STEPS; i++) {
        s_Data[threadIdx.z][threadIdx.y][threadIdx.x + i * HES_BLOCKDIM_X] = d_Src[i * HES_BLOCKDIM_X];
    }

    // Load left halo data
    #pragma unroll
    for (int i = 0; i < HES_HALO_STEPS; i++) {
        s_Data[threadIdx.z][threadIdx.y][threadIdx.x + i * HES_BLOCKDIM_X] = (baseX + i * HES_BLOCKDIM_X >= 0) ? d_Src[i * HES_BLOCKDIM_X] : 0.0f;
    }

    // Load right halo data
    #pragma unroll
    for (int i = HES_HALO_STEPS + HES_RESULT_STEPS; i < HES_HALO_STEPS + HES_RESULT_STEPS + HES_HALO_STEPS; i++) {
        s_Data[threadIdx.z][threadIdx.y][threadIdx.x + i * HES_BLOCKDIM_X] = (baseX + i * HES_BLOCKDIM_X < imageW) ? d_Src[i * HES_BLOCKDIM_X] : 0.0f;
    }

    // yz edge is no need to compute
    if (threadIdx.z == 0 || threadIdx.z == HES_BLOCKDIM_Z + 1 || threadIdx.y == 0 || threadIdx.y == HES_BLOCKDIM_Y + 1)
        return;

    __syncthreads();

    // Compute and store results
    #pragma unroll
    for (int i = HES_HALO_STEPS; i < HES_HALO_STEPS + HES_RESULT_STEPS; i++)
    {
        float xx, xy, xz, yy, yz, zz;
        xx = s_Data[threadIdx.z][threadIdx.y][threadIdx.x + i * HES_BLOCKDIM_X - 1]
           + s_Data[threadIdx.z][threadIdx.y][threadIdx.x + i * HES_BLOCKDIM_X + 1]
           - s_Data[threadIdx.z][threadIdx.y][threadIdx.x + i * HES_BLOCKDIM_X] * 2;
        xy = s_Data[threadIdx.z][threadIdx.y + 1][threadIdx.x + i * HES_BLOCKDIM_X + 1]
           + s_Data[threadIdx.z][threadIdx.y - 1][threadIdx.x + i * HES_BLOCKDIM_X - 1]
           - s_Data[threadIdx.z][threadIdx.y + 1][threadIdx.x + i * HES_BLOCKDIM_X - 1]
           - s_Data[threadIdx.z][threadIdx.y - 1][threadIdx.x + i * HES_BLOCKDIM_X + 1];
        xz = s_Data[threadIdx.z + 1][threadIdx.y][threadIdx.x + i * HES_BLOCKDIM_X + 1]
           + s_Data[threadIdx.z - 1][threadIdx.y][threadIdx.x + i * HES_BLOCKDIM_X - 1]
           - s_Data[threadIdx.z + 1][threadIdx.y][threadIdx.x + i * HES_BLOCKDIM_X - 1]
           - s_Data[threadIdx.z - 1][threadIdx.y][threadIdx.x + i * HES_BLOCKDIM_X + 1];
        yy = s_Data[threadIdx.z][threadIdx.y + 1][threadIdx.x + i * HES_BLOCKDIM_X]
           + s_Data[threadIdx.z][threadIdx.y - 1][threadIdx.x + i * HES_BLOCKDIM_X]
           - s_Data[threadIdx.z][threadIdx.y][threadIdx.x + i * HES_BLOCKDIM_X] * 2;
        yz = s_Data[threadIdx.z + 1][threadIdx.y + 1][threadIdx.x + i * HES_BLOCKDIM_X]
           + s_Data[threadIdx.z - 1][threadIdx.y - 1][threadIdx.x + i * HES_BLOCKDIM_X]
           - s_Data[threadIdx.z + 1][threadIdx.y - 1][threadIdx.x + i * HES_BLOCKDIM_X]
           - s_Data[threadIdx.z - 1][threadIdx.y + 1][threadIdx.x + i * HES_BLOCKDIM_X];
        zz = s_Data[threadIdx.z + 1][threadIdx.y][threadIdx.x + i * HES_BLOCKDIM_X]
           + s_Data[threadIdx.z - 1][threadIdx.y][threadIdx.x + i * HES_BLOCKDIM_X]
           - s_Data[threadIdx.z][threadIdx.y][threadIdx.x + i * HES_BLOCKDIM_X] * 2;

        xy *= 0.25f; 
        xz *= 0.25f; 
        yz *= 0.25f;

        d_hessian_pd[i * HES_BLOCKDIM_X] = (xx < 0 && (xx * yy - xy * xy) < 0 && (xx * yy * zz + 2 * xy * yz * xz - xx * yz * yz - yy * xz * xz - zz * xy * xy) < 0) ? 1 : 0;
    }
}