#include "hip/hip_runtime.h"
#include "includes.h"

__device__ double digamma(double x) {
    double result = 0.0, xx, xx2, xx4;
    for ( ; x < 7.0; ++x) { // Reduce x till x < 7
        result -= 1.0/x;
    }
    x -= 1.0/2.0;
    xx = 1.0/x;
    xx2 = xx*xx;
    xx4 = xx2*xx2;
    result += log(x)+(1./24.)*xx2-(7.0/960.0)*xx4+(31.0/8064.0)*xx4*xx2-(127.0/30720.0)*xx4*xx4;
    return result;
}

__global__ void kernel_evaluatenu(int Nd, double qsum, double *q, double deltanu, double nulow) {
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < Nd) {
        double thisnu = (nulow + ((double)tid) * deltanu);
        double dgm1 = digamma(thisnu * 0.5 + 0.5); // Precompute digamma values
        double dgm2 = digamma(thisnu * 0.5);
        
        // Simplified assignments and calculations
        double log_term1 = log((thisnu + 1.0) * 0.5);
        double log_term2 = log(thisnu * 0.5);
        
        q[tid] = dgm1 - log_term1 - dgm2 + log_term2 - qsum + 1.0; // Consolidate calculations
    }
}