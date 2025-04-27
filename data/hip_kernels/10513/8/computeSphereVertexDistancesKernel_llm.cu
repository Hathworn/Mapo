#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computeSphereVertexDistancesKernel(float4 *V, float *dist, unsigned int *NEIGHBOR, unsigned int *NBOFFSETS, unsigned int *nNeighbors, unsigned int nVertices, float circumference)
{
    int n, N;
    int offset, soffset;

    // Calculate a unique index for each thread
    int vidxb = 4 * (blockIdx.x * blockDim.x) + threadIdx.x;

    int basevert = 4 * (blockIdx.x * blockDim.x);

    float4 nv, tv;
    float dot, n1, n2, norm;

    // Cache shared memory for vertex data
    __shared__ float4 SI[4 * BLOCK_SIZE_CVD];

    // Use a stride pattern to load vertex data into shared memory
    for (int vidx = vidxb; vidx < vidxb + 4 * BLOCK_SIZE_CVD; vidx += BLOCK_SIZE_CVD) {
        if (vidx < nVertices) {
            SI[threadIdx.x] = V[vidx];
            threadIdx.x += BLOCK_SIZE_CVD;
        }
    }

    __syncthreads();

    // Separate block to reduce warp divergence
    for (int vidx = vidxb; vidx < vidxb + 4 * BLOCK_SIZE_CVD; vidx += BLOCK_SIZE_CVD) {
        if (vidx < nVertices) {
            offset = NBOFFSETS[vidx];
            N = nNeighbors[vidx];
            tv = SI[threadIdx.x];

            for (n = 0; n < N; n++) {
                soffset = NEIGHBOR[offset + n];

                // Determine if neighbor is in cache; otherwise, fetch from global
                float4 nv = (int tab = soffset - basevert; (tab > 0 && tab < 4 * BLOCK_SIZE_CVD)) ? SI[tab] : V[soffset];

                // Calculate dot products and norms using intrinsic functions
                dot = __fmul_rn(tv.x, nv.x);
                dot = __fadd_rn(dot, __fmul_rn(tv.y, nv.y));
                dot = __fadd_rn(dot, __fmul_rn(tv.z, nv.z));

                n1 = __fmul_rn(tv.x, tv.x);
                n1 = __fadd_rn(n1, __fmul_rn(tv.y, tv.y));
                n1 = __fadd_rn(n1, __fmul_rn(tv.z, tv.z));

                n2 = __fmul_rn(nv.x, nv.x);
                n2 = __fadd_rn(n2, __fmul_rn(nv.y, nv.y));
                n2 = __fadd_rn(n2, __fmul_rn(nv.z, nv.z));

                norm = __fmul_rn(__fsqrt_rn(n1), __fsqrt_rn(n2));

                // Handle edge cases with direct assignments
                if (norm < 1.0e-7f) {
                    dist[offset + n] = 0.0f;
                } else if (fabsf(dot) > norm) {
                    dist[offset + n] = 0.0f;
                } else {
                    dist[offset + n] = __fmul_rn(circumference, fabsf(acosf(dot / norm)));
                }
            }
        }
    }
}