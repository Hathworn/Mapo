#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void markSegments(unsigned short* d_mark, unsigned int circuitGraphEdgeCount, unsigned int* d_cg_edge_start, unsigned int* d_cedgeCount, unsigned int circuitVertexSize) {
    // Calculate global thread index more efficiently
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int gridStride = blockDim.x * gridDim.x;

    // Use loop to handle larger data sizes
    while (tid < circuitVertexSize) {
        d_mark[d_cg_edge_start[tid]] = d_cedgeCount[tid];
        tid += gridStride;
    }
}