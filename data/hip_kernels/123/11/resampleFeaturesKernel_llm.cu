#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void resampleFeaturesKernel(double* u, double* v, double* d, double* vu, double* vv, double* vd, double* weights, double* randvals, int n_features, double* u_sampled, double* v_sampled, double* d_sampled, double* vu_sampled, double* vv_sampled, double* vd_sampled)
{
    int n_particles = blockDim.x;
    double interval = 1.0 / n_particles; // Precompute interval for efficiency

    for (int n = blockIdx.x; n < n_features; n += gridDim.x) {
        double r = randvals[n] + threadIdx.x * interval;
        int offset = n * n_particles;
        int idx = offset;

        // Use shared memory to cache weights for faster access (only if fits into shared memory)
        __shared__ double sharedWeights[/* specify size based on blockDim.x */];
        if (threadIdx.x == 0) {
            for (int i = 0; i < n_particles; ++i) {
                sharedWeights[i] = weights[offset + i];
            }
        }
        __syncthreads();

        double c = sharedWeights[0];
        while (r > c && idx < offset + n_particles) {
            c += sharedWeights[++idx - offset];
        }

        int idx_new = offset + threadIdx.x;
        u_sampled[idx_new] = u[idx];
        v_sampled[idx_new] = v[idx];
        d_sampled[idx_new] = d[idx];
        vu_sampled[idx_new] = vu[idx];
        vv_sampled[idx_new] = vv[idx];
        vd_sampled[idx_new] = vd[idx];
    }
}