#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define TB 256
#define EPS 1e-4

__global__ void matting_laplacian_kernel(float *input, float *grad, int h, int w, int *CSR_rowIdx, int *CSR_colIdx, float *CSR_val, int N) {
    int size = h * w;
    int _id = blockIdx.x * blockDim.x + threadIdx.x;

    if (_id >= size) return;  // Early exit if _id is out of bounds

    int x = _id % w, y = _id / w;
    int id = x * h + y;

    // Binary search optimization: replace with simple lookup since CSR_rowIdx is sorted
    int index_start = CSR_rowIdx[id] - 1;
    int index_end = ((id + 1 < size) ? CSR_rowIdx[id + 1] : N) - 1;

    for (int i = index_start; i < index_end; i++) {
        int _colIdx = CSR_colIdx[i] - 1;
        float val = CSR_val[i];
        
        int _x = _colIdx / h, _y = _colIdx % h;
        int colIdx = _y * w + _x;

        // Access and compute each component once
        float input_val = 2 * val;
        grad[_id]         += input_val * input[colIdx];
        grad[_id + size]  += input_val * input[colIdx + size];
        grad[_id + 2*size] += input_val * input[colIdx + 2*size];
    }
    
    return;
}