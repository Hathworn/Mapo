#include "hip/hip_runtime.h"
#include "includes.h"
const int Nthreads = 1024, maxFR = 100000, NrankMax = 3, nmaxiter = 500, NchanMax = 32;

__global__ void cleanup_spikes(const double *Params, const float *data, const float *mu, const float *err, const float *eloss, const int *ftype, int *st, int *id, float *x, float *y, float *z, int *counter) {

    int lockout, indx, tid, NT, tid0, j, id0, t0;
    volatile __shared__ float sdata[Nthreads + 2 * 81 + 1];
    bool flag = false;
    float err0, Th;

    lockout = (int) Params[4] - 1;
    tid = threadIdx.x;

    // Pre-calculate block index * block size to avoid repetitive multiplication
    int blockSize = blockDim.x;
    int blockStart = blockIdx.x * blockSize;

    NT = (int) Params[0];
    Th = (float) Params[2];

    // Loop over data chunks
    while (blockStart < NT - Nthreads - lockout + 1) {
        tid0 = blockStart;

        // Load data into shared memory in coalesced manner
        if (tid < 2 * lockout)
            sdata[tid] = err[tid0 + tid];
        sdata[tid + 2 * lockout] = err[2 * lockout + tid0 + tid];

        __syncthreads();

        err0 = sdata[tid + lockout];
        if (err0 > Th * Th) {
            flag = false;

            // Use parallel reduction technique for maximum comparison
            #pragma unroll
            for (j = -lockout; j <= lockout; j++) {
                if (sdata[tid + lockout + j] > err0) {
                    flag = true;
                    break;
                }
            }

            if (!flag) {
                indx = atomicAdd(&counter[0], 1);
                if (indx < maxFR) {
                    t0 = tid + lockout + tid0;
                    id0 = ftype[t0];
                    st[indx] = t0;
                    id[indx] = id0;
                    y[indx] = data[t0 + NT * id0];

                    x[indx] = sqrt(err0);
                    z[indx] = eloss[t0];
                }
            }
        }

        // Increment the block start index by total blocks size
        blockStart += blockSize * gridDim.x;
    }
}