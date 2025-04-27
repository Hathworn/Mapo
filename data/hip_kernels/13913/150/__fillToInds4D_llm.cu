#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __fillToInds4D(float A, float *B, int ldb, int rdb, int tdb, int *I, int nrows, int *J, int ncols, int *K, int nk, int *L, int nl) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;  // Direct thread index
    int total_threads = gridDim.x * blockDim.x;

    int id, mapi, mapj, mapk, mapl;
    int l, k, j, i;
    
    for (id = tid; id < nrows * ncols * nk * nl; id += total_threads) {
        int tidrem = id;
        l = tidrem / (nrows * ncols * nk);  // Calculate l directly
        tidrem %= (nrows * ncols * nk);
        k = tidrem / (nrows * ncols);       // Calculate k directly
        tidrem %= (nrows * ncols);
        j = tidrem / nrows;                 // Calculate j directly
        i = tidrem % nrows;                 // Calculate i directly

        mapl = (L != NULL) ? L[l] : l;      // Use tertiary operators for compactness
        mapk = (K != NULL) ? K[k] : k;
        mapj = (J != NULL) ? J[j] : j;
        mapi = (I != NULL) ? I[i] : i;

        B[mapi + ldb * (mapj + rdb * (mapk + tdb * mapl))] = A;  // Linearize and assign
    }
}