#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __fillToInds4DLong(long long A, long long *B, int ldb, int rdb, int tdb, int *I, int nrows, int *J, int ncols, int *K, int nk, int *L, int nl) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int gridStride = blockDim.x * gridDim.x;
    int idx, mapi, mapj, mapk, mapl;
    
    for (idx = tid; idx < nrows * ncols * nk * nl; idx += gridStride) {
        // Calculate 4D index from flat index
        int l = idx / (nrows * ncols * nk);
        int rem = idx % (nrows * ncols * nk);
        int k = rem / (nrows * ncols);
        rem = rem % (nrows * ncols);
        int j = rem / nrows;
        int i = rem % nrows;
        
        // Apply mapping if necessary
        mapl = (L != NULL) ? L[l] : l;
        mapk = (K != NULL) ? K[k] : k;
        mapj = (J != NULL) ? J[j] : j;
        mapi = (I != NULL) ? I[i] : i;
        
        // Store the value
        B[mapi + ldb * (mapj + rdb * (mapk + tdb * mapl))] = A;
    }
}