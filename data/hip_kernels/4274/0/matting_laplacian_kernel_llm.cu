#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define TB 256
#define EPS 1e-4

__global__ void matting_laplacian_kernel( float *input, float *grad, int h, int w, int *CSR_rowIdx, int *CSR_colIdx, float *CSR_val, int N )
{
    int size = h * w;
    int _id = blockIdx.x * blockDim.x + threadIdx.x;

    if (_id < size) {
        int x = _id % w, y = _id / w;
        int id = x * h + y;

        // Use binary search to find the starting index
        int start = 0;
        int end = N - 1;
        int index = -1;
        while (start <= end) {
            int mid = (start + end) / 2;
            int rowIdx = (CSR_rowIdx[mid]) - 1;

            if (rowIdx == id) {
                index = mid;
                break;
            }
            if (rowIdx > id) {
                end = mid - 1;
            } else {
                start = mid + 1;
            }
        }

        if (index != -1) {
            // Determine the range of column indices for this row
            int index_s = index;
            int index_e = index;
            while (index_s >= 0 && (CSR_rowIdx[index_s] - 1) == id) index_s--;
            while (index_e < N && (CSR_rowIdx[index_e] - 1) == id) index_e++;

            // Sum up the values for this row
            for (int i = index_s + 1; i < index_e; i++) {
                int _colIdx = CSR_colIdx[i] - 1;
                float val  = CSR_val[i];

                int _x = _colIdx / h, _y = _colIdx % h;
                int colIdx = _y * w + _x;

                // Accumulate gradient using shared input values
                float inputCol = input[colIdx];
                grad[_id]         += 2 * val * inputCol;
                grad[_id + size]  += 2 * val * input[colIdx + size];
                grad[_id + 2*size] += 2 * val * input[colIdx + 2*size];
            }
        }
    }
}