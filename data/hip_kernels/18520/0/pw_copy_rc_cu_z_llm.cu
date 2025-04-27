__global__ void pw_copy_rc_cu_z(const double *din, double *zout, const int n) {
    const int igpt = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    if (igpt < n) {
        int index = 2 * igpt;
        zout[index] = din[igpt];
        zout[index + 1] = 0.0;
    }
}