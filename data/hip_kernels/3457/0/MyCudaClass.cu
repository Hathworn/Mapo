#include "hip/hip_runtime.h"
#include "MyClass.h"

class MyCudaClass : public MyClass {
    public:
        using Base = MyClass;

        double *devParam;
        const size_t dubSize = sizeof(double);

        int nCudaBlocks = 1;
        int nCudaThreadsPerBlock = 1;

        MyCudaClass(){
            hipMalloc((void **)&devParam, dubSize);
        }

        ~MyCudaClass(){
            hipFree(devParam);
        }

        void set_param(double in){
            Base::set_param(in);
            hipMemcpy(devParam, &(Base::hostParam), dubSize, hipMemcpyHostToDevice);
        }

        double do_it_on_device(){
            double *devOut, out;
            hipMalloc((void **)&devOut, dubSize);
            devKernel<<< nCudaBlocks, nCudaThreadsPerBlock >>>(devParam, devOut);
            hipMemcpy(&out, devOut, dubSize, hipMemcpyDeviceToHost);
            return out;
        }

        __global__ static void devKernel(double *param, double *ans){
            // Cuda implementation
            std::printf("Inside devKernel: ");
            *ans = *param + 3.14;
        }

};