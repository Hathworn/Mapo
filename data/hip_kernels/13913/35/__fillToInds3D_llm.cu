#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __fillToInds3D(double A, double *B, int ldb, int rdb, int *I, int nrows, int *J, int ncols, int *K, int nk) {
    // Calculate thread indices
    int ii = threadIdx.x + blockDim.x * blockIdx.x;
    int jj = threadIdx.y + blockDim.y * blockIdx.y;
    int kk = threadIdx.z + blockDim.z * blockIdx.z;
    
    // Use cache-efficient strides
    int stride_i = blockDim.x * gridDim.x;
    int stride_j = blockDim.y * gridDim.y;
    int stride_k = blockDim.z * gridDim.z;
    
    // Loop with improved memory access pattern
    for (int k = kk; k < nk; k += stride_k) {
        int mapk = (K != NULL) ? K[k] : k;
        for (int j = jj; j < ncols; j += stride_j) {
            int mapj = (J != NULL) ? J[j] : j;
            for (int i = ii; i < nrows; i += stride_i) {
                int mapi = (I != NULL) ? I[i] : i;
                B[mapi + ldb * (mapj + rdb * mapk)] = A;  // Direct access optimization
            }
        }
    }
}