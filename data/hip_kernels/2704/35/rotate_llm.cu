#include "hip/hip_runtime.h"
#include "includes.h"

// To suppress the unused variable argument for ARM targets
#pragma diag_suppress 177

#ifndef NAN
#define NAN (0.0/0.0)
#endif

#define ACCU_ARRTYPE double
#define IMUL(a, b) __mul24(a, b)

#ifndef CUIMAGE_REDUCE_THREADS
#define CUIMAGE_REDUCE_THREADS 512
#endif

#define NBLOCKS(N,blockSize) (N/blockSize+(N%blockSize==0?0:1))
#define NBLOCKSL(N,blockSize) 1

__global__ void rotate(float* a, float b, float* c, size_t sx, size_t sy, size_t sz, size_t dx, size_t dy, size_t dz, size_t ux, size_t uy, size_t uz) {
    size_t id = ((blockIdx.y * gridDim.x + blockIdx.x) * blockDim.x + threadIdx.x);
    size_t Processes = blockDim.x * gridDim.x;
    size_t chains = ux * uy * uz;
    size_t N = sx * sy * sz;
    size_t length = N / chains;
    size_t steps = (N + Processes - 1) / Processes; // Ensure all data is covered

    float swp, nswp;

    // Optimize the computation process using loops and conditions
    for (size_t idx = id * steps; idx < min(N, (id + 1) * steps); ++idx) {
        size_t step = idx;
        size_t nl = step % length;
        size_t nx = (step / length) % ux;
        size_t ny = (step / (length * ux)) % uy;
        size_t nz = (step / (length * ux * uy)) % uz;

        size_t x = (nx + nl * dx) % sx;
        size_t y = (ny + nl * dy) % sy;
        size_t z = (nz + nl * dz) % sz;
        size_t idd = x + sx * y + sx * sy * z;

        if (nl < length - 1) {
            swp = a[idd];
            __syncthreads();
            x = (x + dx) % sx;
            y = (y + dy) % sy;
            z = (z + dz) % sz;
            idd = x + sx * y + sx * sy * z;
            nswp = a[idd];
            __syncthreads();
            c[idd] = swp + 0.1;
            swp = nswp;
        }

        // Final write to avoid race conditions
        c[idd] = swp + 0.1;
    }
}