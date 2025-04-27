#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_find_vac( const int num_atoms, const int correlation_step, const double* g_vx, const double* g_vy, const double* g_vz, const double* g_vx_all, const double* g_vy_all, const double* g_vz_all, double* g_vac_x, double* g_vac_y, double* g_vac_z)
{
    int tid = threadIdx.x;
    int bid = blockIdx.x;
    int size_sum = bid * num_atoms;
    int number_of_rounds = (num_atoms - 1) / 128 + 1;
    __shared__ double s_vac_x[128];
    __shared__ double s_vac_y[128];
    __shared__ double s_vac_z[128];

    double vac_x = 0.0;
    double vac_y = 0.0;
    double vac_z = 0.0;

    // Loop unrolling for performance
    for (int round = 0; round < number_of_rounds; round += 2) {
        int n1 = tid + round * 128;
        int n2 = n1 + 128;
        
        if (n1 < num_atoms) {
            vac_x += g_vx[n1] * g_vx_all[size_sum + n1];
            vac_y += g_vy[n1] * g_vy_all[size_sum + n1];
            vac_z += g_vz[n1] * g_vz_all[size_sum + n1];
        }

        if (n2 < num_atoms) {
            vac_x += g_vx[n2] * g_vx_all[size_sum + n2];
            vac_y += g_vy[n2] * g_vy_all[size_sum + n2];
            vac_z += g_vz[n2] * g_vz_all[size_sum + n2];
        }
    }

    s_vac_x[tid] = vac_x;
    s_vac_y[tid] = vac_y;
    s_vac_z[tid] = vac_z;
    __syncthreads();

    for (int offset = blockDim.x >> 1; offset > 0; offset >>= 1) {
        if (tid < offset) {
            s_vac_x[tid] += s_vac_x[tid + offset];
            s_vac_y[tid] += s_vac_y[tid + offset];
            s_vac_z[tid] += s_vac_z[tid + offset];
        }
        __syncthreads();
    }

    // Reduce memory accesses for updating global memory
    if (tid == 0) {
        int index = (bid <= correlation_step) ? (correlation_step - bid) : (correlation_step + gridDim.x - bid);
        atomicAdd(&g_vac_x[index], s_vac_x[0]);
        atomicAdd(&g_vac_y[index], s_vac_y[0]);
        atomicAdd(&g_vac_z[index], s_vac_z[0]);
    }
}