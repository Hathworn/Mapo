#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __fillToInds3D(float A, float *B, int ldb, int rdb, int *I, int nrows, int *J, int ncols, int *K, int nk) {
    // Calculate global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x; 
    int step = blockDim.x * gridDim.x;
    
    // Loop to update B at specified indices
    for (int id = tid; id < nrows * ncols * nk; id += step) {
        int k = id / (nrows * ncols);
        int remainder = id % (nrows * ncols);
        int j = remainder / nrows;
        int i = remainder % nrows;
        
        // Map indices through I, J, K arrays if they exist
        int mapi = (I != NULL) ? I[i] : i;
        int mapj = (J != NULL) ? J[j] : j;
        int mapk = (K != NULL) ? K[k] : k;
        
        // Efficient memory access to update B
        B[mapi + ldb * (mapj + rdb * mapk)] = A;
    }
}