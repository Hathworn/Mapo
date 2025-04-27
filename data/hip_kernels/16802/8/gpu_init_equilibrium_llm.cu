#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ size_t gpu_fieldn_index(unsigned int x, unsigned int y, unsigned int z, unsigned int d) {
    return (NX*(NY*(NZ*(d-1)+z)+y)+x);
}

__device__ __forceinline__ size_t gpu_scalar_index(unsigned int x, unsigned int y, unsigned int z) {
    return NX*(NY*z + y)+x;
}

__device__ __forceinline__ size_t gpu_field0_index(unsigned int x, unsigned int y, unsigned int z) {
    return NX*(NY*z + y)+x;
}

__global__ void gpu_init_equilibrium(double *f0, double *f1, double *h0, double *h1, double *temp0, double *temp1, double *r, double *c, double *u, double *v, double *w, double *ex, double *ey, double *ez, double *temp) {
    unsigned int y = blockIdx.y;
    unsigned int z = blockIdx.z;
    unsigned int x = blockIdx.x*blockDim.x+threadIdx.x;

    double rho = r[gpu_scalar_index(x,y,z)];
    double ux = u[gpu_scalar_index(x,y,z)];
    double uy = v[gpu_scalar_index(x,y,z)];
    double uz = w[gpu_scalar_index(x,y,z)];
    double charge = c[gpu_scalar_index(x,y,z)];
    double Ex = ex[gpu_scalar_index(x,y,z)];
    double Ey = ey[gpu_scalar_index(x,y,z)];
    double Ez = ez[gpu_scalar_index(x,y,z)];
    double Temp = temp[gpu_scalar_index(x,y,z)];

    // Temporary variables
    double w0r = w0 * rho;
    double wsr = ws * rho;
    double war = wa * rho;
    double wdr = wd * rho;

    double w0c = w0 * charge;
    double wsc = ws * charge;
    double wac = wa * charge;
    double wdc = wd * charge;

    double w0t = w0 * Temp;
    double wst = ws * Temp;
    double wat = wa * Temp;
    double wdt = wd * Temp;

    double omusq = 1.0 - 0.5 * (ux*ux+uy*uy+uz*uz)/cs_square;
    double omusq_c = 1.0 - 0.5 * ((ux + K*Ex)*(ux + K*Ex) + (uy + K*Ey)*(uy + K*Ey) + (uz + K*Ez)*(uz + K*Ez)) / cs_square;

    double tux = ux / cs_square / CFL;
    double tuy = uy / cs_square / CFL;
    double tuz = uz / cs_square / CFL;
    double tux_c = (ux + K*Ex) / cs_square / CFL;
    double tuy_c = (uy + K*Ey) / cs_square / CFL;
    double tuz_c = (uz + K*Ez) / cs_square / CFL;

    // Optimization by precomputing repeated expressions
    double omusq_factors[] = {tux, -tux, tuy, -tuy, tuz, -tuz, tux+tuy, -tuy-tux, tux+tuz, -tux-tuz, tuz+tuy, -tuy-tuz, tux-tuy, tuy-tux, tux-tuz, tuz-tux, tuy-tuz, tuz-tuy, tux+tuy+tuz, -tuy-tux-tuz, tux+tuy-tuz, tuz-(tux+tuy), tux+tuz-tuy, tuy-(tux+tuz), tuy+tuz-tux, tux-(tuy+tuz)};
    double factors_c[] = {tux_c, -tux_c, tuy_c, -tuy_c, tuz_c, -tuz_c, tux_c+tuy_c, -tuy_c-tux_c, tux_c+tuz_c, -tux_c-tuz_c, tuy_c+tuz_c, -tuy_c-tuz_c, tux_c-tuy_c, tuy_c-tux_c, tux_c-tuz_c, tuz_c-tux_c, tuy_c-tuz_c, tuz_c-tuy_c, tux_c+tuy_c+tuz_c, -tux_c-tuy_c-tuz_c, tux_c+tuy_c-tuz_c, tuz_c-(tux_c+tuy_c), tux_c+tuz_c-tuy_c, tuy_c-(tux_c+tuz_c), tuy_c+tuz_c-tux_c, tux_c-(tuy_c+tuz_c)};

    // Zero weight assignments
    f0[gpu_field0_index(x,y,z)] = w0r * omusq;
    h0[gpu_field0_index(x,y,z)] = w0c * omusq_c;
    temp0[gpu_field0_index(x, y, z)] = w0t * omusq;

    // Loop over directions to optimize repetitive code
    for (int i = 0; i < 6; ++i) {
        f1[gpu_fieldn_index(x,y,z,i+1)] = wsr * (omusq + omusq_factors[i]*(1.0 + 0.5*omusq_factors[i]));
        h1[gpu_fieldn_index(x,y,z,i+1)] = wsc * (omusq_c + factors_c[i]*(1.0 + 0.5*factors_c[i]));
        temp1[gpu_fieldn_index(x, y, z, i+1)] = wst * (omusq + omusq_factors[i]*(1.0 + 0.5*omusq_factors[i]));
    }
    
    for (int i = 6; i < 18; ++i) {
        f1[gpu_fieldn_index(x,y,z,i+1)] = ((i < 12) ? war : wdr) * (omusq + omusq_factors[i]*(1.0 + 0.5*omusq_factors[i]));
        h1[gpu_fieldn_index(x,y,z,i+1)] = ((i < 12) ? wac : wdc) * (omusq_c + factors_c[i]*(1.0 + 0.5*factors_c[i]));
        temp1[gpu_fieldn_index(x, y, z, i+1)] = ((i < 12) ? wat : wdt) * (omusq + omusq_factors[i]*(1.0 + 0.5*omusq_factors[i]));
    }
}