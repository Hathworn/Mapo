```c
#include "hip/hip_runtime.h"
#include "includes.h"
const int  Nthreads = 1024,  NrankMax = 3, nt0max = 71, NchanMax = 1024;

//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
__global__ void getW(const double *Params, double *wtw, double *W){

    int Nfilt, nt0, tid, bid, Nrank, tmax;
    double x, x0, xmax;
    __shared__ double sW[nt0max * NrankMax], swtw[nt0max * nt0max], xN[1];

    nt0    = (int) Params[4];
    Nrank  = (int) Params[6];
    Nfilt  = (int) Params[1];
    tmax   = (int) Params[11];

    tid = threadIdx.x;
    bid = blockIdx.x;

    // Optimized shared memory loading
    for (int k = tid; k < nt0 * nt0; k += Nthreads)
        swtw[k] = wtw[k + bid * nt0 * nt0];
    
    for (int k = tid; k < Nrank * nt0; k += Nthreads)
        sW[k] = W[k + bid * nt0 * Nfilt];

    __syncthreads();

    // For each SVD rank
    for (int k = 0; k < Nrank; k++) {
        for (int i = 0; i < 100; i++) {
            x = 0.0f;
            // Compute projection of wtw
            for (int t = tid; t < nt0; t += Nthreads) // Partial reduction in thread loop
                x += swtw[tid + t * nt0] * sW[t + k * nt0];

            atomicAdd(&xN[0], x); // Use atomic addition for partial results

            __syncthreads();

            if (i < 99) {
                x0 = 0.00001f;
                if (tid == 0) xN[0] = 0.0f;

                __syncthreads();

                for (int t = tid; t < nt0; t += Nthreads)
                    atomicAdd(&xN[0], sW[t + k * nt0] * sW[t + k * nt0]);

                __syncthreads();

                if (tid == 0) xN[0] = sqrt(xN[0]);

                __syncthreads();

                for (int t = tid; t < nt0; t += Nthreads)
                    sW[t + k * nt0] = xN[0] ? x / xN[0] : 0.0; // Avoid division by zero
            }
            __syncthreads();
        }

        // Subtract off this SVD from wtw
        for (int t = tid; t < nt0; t += Nthreads)
            swtw[tid + t * nt0] -= sW[t + k * nt0] * x;

        __syncthreads();
    }

    xmax = sW[tmax];
    __syncthreads();

    for (int t = tid; t < nt0; t += Nthreads)
        sW[t] = -sW[t] * copysign(1.0, xmax);

    // Write W back
    for (int k = tid; k < Nrank * nt0; k += Nthreads)
        W[k + bid * nt0 * Nfilt] = sW[k];
}