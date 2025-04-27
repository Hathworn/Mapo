#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rotate(float* a, float b, float* c, int sx, int sy, int sz, int dx, int dy, int dz, int ux, int uy, int uz) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // ID of current processor
    int Processes = blockDim.x * gridDim.x;
    int chains = ux * uy * uz;  // Total number of independent chains
    int N = sx * sy * sz;  // Total size of array
    int length = N / chains;  // Chain length
    int steps = N / Processes;  // Steps each processor has to do

    if (id >= Processes) return; // Return if id exceeds total processes

    int step = steps * id;  // Starting step for this ID
    int nl = step % length;
    int nx = (step / length) % ux;
    int ny = (step / (length * ux)) % uy;
    int nz = (step / (length * ux * uy)) % uz;
    int i = 0;

    float swp, nswp;

    while (nz < uz) {
        while (ny < uy) {
            while (nx < ux) {
                int x = (nx + nl * dx) % sx;  // Calculate new positions
                int y = (ny + nl * dy) % sy;
                int z = (nz + nl * dz) % sz;
                int idd = x + sx * y + sx * sy * z;

                if (i < steps) {
                    swp = a[idd];
                    __syncthreads();
                }

                while (nl < length - 1 && step < N && i < steps - 1) {
                    step++;
                    x = (x + dx) % sx;
                    y = (y + dy) % sy;
                    z = (z + dz) % sz;
                    idd = x + sx * y + sx * sy * z;

                    nswp = a[idd];
                    __syncthreads();
                    c[idd] = swp + 0.1;  // Store result
                    i++;
                    nl++;
                    swp = nswp;
                }

                nx++; nl = 0;  // Reset nl and move to next nx
                x = (x + dx) % sx;
                y = (y + dy) % sy;
                z = (z + dz) % sz;
                idd = x + sx * y + sx * sy * z;
                c[idd] = swp + 0.1;  // Final write for this nx
                i++;

                if (i >= steps) goto nextProcessor; // Exit if steps exceeded
            }
            ny++;
            nx = 0; x = 0;
        }
        nz++;
        ny = 0; y = 0;
    }
nextProcessor:
    return;
}