#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void recombiner(double *rands, unsigned int *parents, unsigned int parent_rows, unsigned int parent_cols, unsigned int *off, unsigned int cols, unsigned int seq_offset) {
    // Load random value only if necessary
    unsigned int id_offset = static_cast<unsigned int>(rands[seq_offset + blockIdx.y]);

    // Calculate only once outside conditional block
    unsigned int col_offset = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate parent's starting offset
    unsigned int p0_offset = id_offset * (parent_rows - 1u) / 2u * parent_cols;

    unsigned int p = 0, q = 0, res = 0;

    // Avoid unnecessary __syncthreads() and access only within bounds
    if (col_offset < parent_cols) {
        unsigned int idx = p0_offset + col_offset;
        p = parents[idx];
        q = parents[idx + parent_cols];
    }

    if (col_offset < cols) {
        // Calculate result based on parents and store directly
        res = off[(seq_offset + blockIdx.y) * cols + col_offset];
        res = ((p & ~res) | (q & res));
        off[(seq_offset + blockIdx.y) * cols + col_offset] = res;
    }
}