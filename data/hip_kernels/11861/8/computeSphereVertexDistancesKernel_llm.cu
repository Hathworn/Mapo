#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void computeSphereVertexDistancesKernel(float4 *V, float *dist, unsigned int *NEIGHBOR, unsigned int *NBOFFSETS, unsigned int *nNeighbors, unsigned int nVertices, float circumference)
{
    int n, N;
    int offset, soffset;

    // Calculate the global vertex index
    int vidxb = 4 * (blockIdx.x * blockDim.x) + threadIdx.x;
    int basevert = 4 * (blockIdx.x * blockDim.x);

    // Create a cache for 4 elements per block (4*BLOCK_SIZE elements)
    __shared__ float4 SI[4 * BLOCK_SIZE_CVD];

    if (vidxb < nVertices) {
        // Load vertices into shared memory
        SI[threadIdx.x] = V[vidxb];
    }

    __syncthreads();

    if (vidxb < nVertices) {
        offset = NBOFFSETS[vidxb];
        N = nNeighbors[vidxb];
        float4 tv = SI[threadIdx.x];

        for (n = 0; n < N; n++)
        {
            soffset = NEIGHBOR[offset + n];
            float4 nv = (soffset >= basevert && soffset < basevert + 4 * BLOCK_SIZE_CVD) ? SI[soffset - basevert] : V[soffset];

            // Calculate dot product
            float dot = __fmaf_rn(tv.z, nv.z, __fmaf_rn(tv.y, nv.y, __fmul_rn(tv.x, nv.x)));

            // Calculate norms
            float n1 = __fmaf_rn(tv.z, tv.z, __fmaf_rn(tv.y, tv.y, __fmul_rn(tv.x, tv.x)));
            float n2 = __fmaf_rn(nv.z, nv.z, __fmaf_rn(nv.y, nv.y, __fmul_rn(nv.x, nv.x)));

            float norm = __fmul_rn(__frsqrt_rn(n1), __frsqrt_rn(n2));

            // Calculate distance
            if (norm < 1.0e-7f || fabsf(dot) > norm)
            {
                dist[offset + n] = 0.0f;
            }
            else
            {
                dist[offset + n] = __fmul_rn(circumference, acosf(dot * norm));
            }
        }
    }
}