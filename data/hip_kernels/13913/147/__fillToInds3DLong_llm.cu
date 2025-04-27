```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __fillToInds3DLong(long long A, long long *B, int ldb, int rdb, int *I, int nrows, int *J, int ncols, int *K, int nk) {
    // Calculate flat thread index within the grid
    int tid = blockIdx.x + blockIdx.y * gridDim.x;
    tid = threadIdx.x + tid * blockDim.x;

    // Calculate total number of threads
    int numThreads = blockDim.x * gridDim.x * gridDim.y;

    int k, j, i, mapi, mapj, mapk;

    // Loop through the elements this thread is responsible for
    for (int id = tid; id < nrows * ncols * nk; id += numThreads) {
        // Calculate 3D indexes from flat index
        k = id / (nrows * ncols);
        j = (id % (nrows * ncols)) / nrows;
        i = id % nrows;

        // Map indices if necessary
        mapk = (K != NULL) ? K[k] : k;
        mapj = (J != NULL) ? J[j] : j;
        mapi = (I != NULL) ? I[i] : i;

        // Write the result
        B[mapi + ldb * (mapj + rdb * mapk)] = A;
    }
}