#include "hip/hip_runtime.h"
#include "includes.h"
const int Nthreads = 1024, maxFR = 5000, NrankMax = 6;

__global__ void cleanup_spikes(const double *Params, const float *err, const int *ftype, float *x, int *st, int *id, int *counter) {
    int lockout = static_cast<int>(Params[4]) - 1;
    int tid = threadIdx.x;
    int bid = blockIdx.x;

    int NT = static_cast<int>(Params[0]);
    int tid0 = bid * blockDim.x;
    float Th = static_cast<float>(Params[2]);

    __shared__ float sdata[Nthreads + 2 * 81 + 1];

    while(tid0 < NT - Nthreads - lockout + 1) {
        // Load data to shared memory, reduce redundant computations
        if (tid < 2 * lockout) {
            sdata[tid] = err[tid0 + tid];
        }
        if (tid0 + tid + 2 * lockout < NT) {
            sdata[tid + 2 * lockout] = err[2 * lockout + tid0 + tid];
        } else {
            sdata[tid + 2 * lockout] = 0.0f;
        }

        __syncthreads();

        int t0 = tid + lockout + tid0;
        float err0 = sdata[tid + lockout];

        if (err0 > Th * Th && t0 < NT - lockout - 1) {
            bool flag = false;

            // Check for a valid spike
            for (int j = -lockout; j <= lockout; ++j) {
                if (sdata[tid + lockout + j] > err0) {
                    flag = true;
                    break;
                }
            }

            if (!flag) {
                int indx = atomicAdd(&counter[0], 1);

                // Store results safely within the bounds of maxFR
                if (indx < maxFR) {
                    st[indx] = t0;
                    id[indx] = ftype[t0];
                    x[indx] = err0;
                }
            }
        }

        // Update starting index for next iteration
        tid0 += blockDim.x * gridDim.x;
    }
}