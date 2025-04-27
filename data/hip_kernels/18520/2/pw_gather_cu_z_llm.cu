#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pw_gather_cu_z(double *pwcc, const double *c, const double scale, const int ngpts, const int *ghatmap) 
{
    const int igpt = (gridDim.x * blockIdx.y + blockIdx.x) * blockDim.x + threadIdx.x;
    if (igpt < ngpts)
    {
        const int idx = ghatmap[igpt];
        double2 val = reinterpret_cast<const double2*>(c)[idx];
        val.x *= scale;
        val.y *= scale;
        reinterpret_cast<double2*>(pwcc)[igpt] = val;
    }
}