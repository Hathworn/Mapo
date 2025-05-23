#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __fillToInds4D(double A, double *B, int ldb, int rdb, int tdb, int *I, int nrows, int *J, int ncols, int *K, int nk, int *L, int nl, int ntk, int nbk, int ntl, int nbl) {
    int ii = threadIdx.x + blockDim.x * blockIdx.x;
    int jj = threadIdx.y + blockDim.y * blockIdx.y;
    int tk = threadIdx.z / ntl;
    int tl = threadIdx.z % ntl; // Simplified calculation
    int bk = blockIdx.z / nbl;
    int bl = blockIdx.z % nbl; // Simplified calculation
    int kk = tk + ntk * bk;
    int ll = tl + ntl * bl;
    int i, j, k, l, mapi, mapj, mapk, mapl;
    
    for (l = ll; l < nl; l += ntl * nbl) {
        mapl = (L != NULL) ? L[l] : l; // Use ternary operator for clarity
        for (k = kk; k < nk; k += ntk * nbk) {
            mapk = (K != NULL) ? K[k] : k; // Use ternary operator for clarity
            for (j = jj; j < ncols; j += blockDim.y * gridDim.y) {
                mapj = (J != NULL) ? J[j] : j; // Use ternary operator for clarity
                if (I != NULL) {
                    for (i = ii; i < nrows; i += blockDim.x * gridDim.x) {
                        mapi = I[i];
                        B[mapi + ldb * (mapj + rdb * (mapk + tdb * mapl))] = A;
                    }
                } else {
                    for (i = ii; i < nrows; i += blockDim.x * gridDim.x) {
                        B[i + ldb * (mapj + rdb * (mapk + tdb * mapl))] = A;
                    }
                }
            }
        }
    }
}