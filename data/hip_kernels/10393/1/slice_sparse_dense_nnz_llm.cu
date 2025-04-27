#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
extern "C"
__global__ void slice_sparse_dense_nnz(double* inVal, int* inRowPtr, int* colInd, double* ret, int rl, int ru, int cl, int cu, int retClen) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if(tid >= inRowPtr[ru+1] - inRowPtr[rl]) return; // Early exit for out-of-range threads

    int i = tid + inRowPtr[rl];

    // Only slice if the index falls into the specified column range
    int colIndex = colInd[i];
    if(cl <= colIndex && colIndex <= cu) {
        // Efficient row index calculation
        int low = rl, high = ru, mid;
        while(low < high) {
            mid = (low + high) / 2;
            if(inRowPtr[mid+1] > i) 
                high = mid;
            else 
                low = mid + 1;
        }
        int rowIndex = low;
        ret[ (rowIndex - rl) * retClen + (colIndex - cl) ] = inVal[i];
    }
}