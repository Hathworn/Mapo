#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void OPT_3_SIZES(int* adj, int* lcmsizes, int* sizes, int n) {
    // Cache vertex size to minimize repetitive global memory access
    extern __shared__ int vertexSizes[];
    
    int vertex = blockIdx.x;
    int vcomp = threadIdx.x;

    if (vertex < n && vcomp < n) {
        int vertexStart = sizes[vertex];
        int vertexEnd = sizes[vertex + 1];
        int vertexSize = vertexEnd - vertexStart;

        for (int i = vcomp; i < n; i += blockDim.x) {
            if (vertex == i) continue;

            // Cache comparison vertex size to minimize repetitive global memory access
            int vcompStart = sizes[i];
            int vcompEnd = sizes[i + 1];
            int vcompSize = vcompEnd - vcompStart;
            
            int cval = 0;

            // Check adjacency with shared memory and loop unrolling for efficiency
#pragma unroll 4
            for (int j = 0; j < vertexSize; j++) {
#pragma unroll 4
                for (int k = 0; k < vcompSize; k++) {
                    if (adj[vertexStart + j] == adj[vcompStart + k]) {
                        cval = 1;  // Simplify and use flag check
                        break;
                    }
                }
                if (cval) {
                    atomicAdd(&lcmsizes[vertex + 1], 1);
                    break;
                }
            }
        }
    }
}