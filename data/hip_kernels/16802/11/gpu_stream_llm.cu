#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ size_t gpu_fieldn_index(unsigned int x, unsigned int y, unsigned int z, unsigned int d)
{
    return (NX*(NY*(NZ*(d-1)+z)+y)+x);
}

__global__ void gpu_stream(double *f0, double *f1, double *f2, double *h0, double *h1, double *h2, double *temp0, double *temp1, double *temp2)
{
    unsigned int y = blockIdx.y;
    unsigned int z = blockIdx.z;
    unsigned int x = blockIdx.x*blockDim.x + threadIdx.x;

    // Streaming step
    unsigned int xp1 = (x + 1) % NX;
    unsigned int yp1 = (y + 1) % NY;
    unsigned int zp1 = (z + 1) % NZ;
    unsigned int xm1 = (NX + x - 1) % NX;
    unsigned int ym1 = (NY + y - 1) % NY;
    unsigned int zm1 = (NZ + z - 1) % NZ;

    #pragma unroll 27
    for (unsigned int d = 1; d <= 26; ++d) {
        // Precompute source indices based on direction `d`
        size_t src_index_f = 0, src_index_h = 0, src_index_temp = 0;

        // Use a single switch to precompute these indices
        switch(d) {
            case 1: src_index_f = gpu_fieldn_index(xm1, y, z, 1); break;
            case 2: src_index_f = gpu_fieldn_index(xp1, y, z, 2); break;
            case 3: src_index_f = gpu_fieldn_index(x, ym1, z, 3); break;
            case 4: src_index_f = gpu_fieldn_index(x, yp1, z, 4); break;
            case 5: src_index_f = gpu_fieldn_index(x, y, zm1, 5); break;
            case 6: src_index_f = gpu_fieldn_index(x, y, zp1, 6); break;
            case 7: src_index_f = gpu_fieldn_index(xm1, ym1, z, 7); break;
            case 8: src_index_f = gpu_fieldn_index(xp1, yp1, z, 8); break;
            case 9: src_index_f = gpu_fieldn_index(xm1, y, zm1, 9); break;
            case 10: src_index_f = gpu_fieldn_index(xp1, y, zp1, 10); break;
            case 11: src_index_f = gpu_fieldn_index(x, ym1, zm1, 11); break;
            case 12: src_index_f = gpu_fieldn_index(x, yp1, zp1, 12); break;
            case 13: src_index_f = gpu_fieldn_index(xm1, yp1, z, 13); break;
            case 14: src_index_f = gpu_fieldn_index(xp1, ym1, z, 14); break;
            case 15: src_index_f = gpu_fieldn_index(xm1, y, zp1, 15); break;
            case 16: src_index_f = gpu_fieldn_index(xp1, y, zm1, 16); break;
            case 17: src_index_f = gpu_fieldn_index(x, ym1, zp1, 17); break;
            case 18: src_index_f = gpu_fieldn_index(x, yp1, zm1, 18); break;
            case 19: src_index_f = gpu_fieldn_index(xm1, ym1, zm1, 19); break;
            case 20: src_index_f = gpu_fieldn_index(xp1, yp1, zp1, 20); break;
            case 21: src_index_f = gpu_fieldn_index(xm1, ym1, zp1, 21); break;
            case 22: src_index_f = gpu_fieldn_index(xp1, yp1, zm1, 22); break;
            case 23: src_index_f = gpu_fieldn_index(xm1, yp1, zm1, 23); break;
            case 24: src_index_f = gpu_fieldn_index(xp1, ym1, zp1, 24); break;
            case 25: src_index_f = gpu_fieldn_index(xp1, ym1, zm1, 25); break;
            case 26: src_index_f = gpu_fieldn_index(xm1, yp1, zp1, 26); break;
        }
        src_index_h = src_index_temp = src_index_f;  // shared computation for all arrays

        // Assign values for `f`, `h` and `temp`
        f1[gpu_fieldn_index(x, y, z, d)] = f2[src_index_f];
        h1[gpu_fieldn_index(x, y, z, d)] = h2[src_index_h];
        temp1[gpu_fieldn_index(x, y, z, d)] = temp2[src_index_temp];
    }
}