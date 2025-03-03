; ModuleID = '../data/hip_kernels/11876/37/main.cu'
source_filename = "../data/hip_kernels/11876/37/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@d_ncases = protected addrspace(4) externally_initialized global i32 0, align 4
@d_ntarg = protected addrspace(4) externally_initialized global i32 0, align 4
@d_class = protected addrspace(4) externally_initialized global i32* null, align 8
@d_output = protected addrspace(4) externally_initialized global double* null, align 8
@d_mse_out = protected addrspace(4) externally_initialized global float* null, align 8
@_ZZ9device_llvE10partial_ll = internal unnamed_addr addrspace(3) global [256 x double] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [5 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (i32* addrspace(4)* @d_class to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @d_mse_out to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @d_ncases to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @d_ntarg to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double* addrspace(4)* @d_output to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9device_llv() local_unnamed_addr #0 {
  %1 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %2 = load i32, i32 addrspace(4)* @d_ncases, align 4, !tbaa !5
  %3 = load i32, i32 addrspace(4)* @d_ntarg, align 4, !tbaa !5
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !9, !invariant.load !10
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !11
  %13 = mul i32 %4, %9
  %14 = add i32 %13, %1
  %15 = icmp slt i32 %14, %2
  br i1 %15, label %16, label %124

16:                                               ; preds = %0
  %17 = load double*, double* addrspace(4)* @d_output, align 8, !tbaa !20
  %18 = load i32*, i32* addrspace(4)* @d_class, align 8, !tbaa !20
  %19 = udiv i32 %12, %9
  %20 = mul i32 %19, %9
  %21 = icmp ugt i32 %12, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %9
  br label %25

25:                                               ; preds = %16, %25
  %26 = phi double [ 0.000000e+00, %16 ], [ %121, %25 ]
  %27 = phi i32 [ %14, %16 ], [ %122, %25 ]
  %28 = mul nsw i32 %27, %3
  %29 = sext i32 %27 to i64
  %30 = getelementptr inbounds i32, i32* %18, i64 %29
  %31 = load i32, i32* %30, align 4, !tbaa !5
  %32 = add nsw i32 %31, %28
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds double, double* %17, i64 %33
  %35 = load double, double* %34, align 8, !tbaa !22
  %36 = fadd contract double %35, 1.000000e-30
  %37 = tail call double @llvm.amdgcn.frexp.mant.f64(double %36)
  %38 = fcmp olt double %37, 0x3FE5555555555555
  %39 = zext i1 %38 to i32
  %40 = tail call double @llvm.amdgcn.ldexp.f64(double %37, i32 %39)
  %41 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %36)
  %42 = sub nsw i32 %41, %39
  %43 = fadd double %40, -1.000000e+00
  %44 = fadd double %40, 1.000000e+00
  %45 = fadd double %44, -1.000000e+00
  %46 = fsub double %40, %45
  %47 = tail call double @llvm.amdgcn.rcp.f64(double %44)
  %48 = fneg double %44
  %49 = tail call double @llvm.fma.f64(double %48, double %47, double 1.000000e+00)
  %50 = tail call double @llvm.fma.f64(double %49, double %47, double %47)
  %51 = tail call double @llvm.fma.f64(double %48, double %50, double 1.000000e+00)
  %52 = tail call double @llvm.fma.f64(double %51, double %50, double %50)
  %53 = fmul double %43, %52
  %54 = fmul double %44, %53
  %55 = fneg double %54
  %56 = tail call double @llvm.fma.f64(double %53, double %44, double %55)
  %57 = tail call double @llvm.fma.f64(double %53, double %46, double %56)
  %58 = fadd double %54, %57
  %59 = fsub double %58, %54
  %60 = fsub double %57, %59
  %61 = fsub double %43, %58
  %62 = fsub double %43, %61
  %63 = fsub double %62, %58
  %64 = fsub double %63, %60
  %65 = fadd double %61, %64
  %66 = fmul double %52, %65
  %67 = fadd double %53, %66
  %68 = fsub double %67, %53
  %69 = fsub double %66, %68
  %70 = fmul double %67, %67
  %71 = tail call double @llvm.fma.f64(double %70, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %72 = tail call double @llvm.fma.f64(double %70, double %71, double 0x3FC7474DD7F4DF2E)
  %73 = tail call double @llvm.fma.f64(double %70, double %72, double 0x3FCC71C016291751)
  %74 = tail call double @llvm.fma.f64(double %70, double %73, double 0x3FD249249B27ACF1)
  %75 = tail call double @llvm.fma.f64(double %70, double %74, double 0x3FD99999998EF7B6)
  %76 = tail call double @llvm.fma.f64(double %70, double %75, double 0x3FE5555555555780)
  %77 = tail call double @llvm.amdgcn.ldexp.f64(double %67, i32 1)
  %78 = tail call double @llvm.amdgcn.ldexp.f64(double %69, i32 1)
  %79 = fmul double %67, %70
  %80 = fmul double %79, %76
  %81 = fadd double %77, %80
  %82 = fsub double %81, %77
  %83 = fsub double %80, %82
  %84 = fadd double %78, %83
  %85 = fadd double %81, %84
  %86 = fsub double %85, %81
  %87 = fsub double %84, %86
  %88 = sitofp i32 %42 to double
  %89 = fmul double %88, 0x3FE62E42FEFA39EF
  %90 = fneg double %89
  %91 = tail call double @llvm.fma.f64(double %88, double 0x3FE62E42FEFA39EF, double %90)
  %92 = tail call double @llvm.fma.f64(double %88, double 0x3C7ABC9E3B39803F, double %91)
  %93 = fadd double %89, %92
  %94 = fsub double %93, %89
  %95 = fsub double %92, %94
  %96 = fadd double %93, %85
  %97 = fsub double %96, %93
  %98 = fsub double %96, %97
  %99 = fsub double %93, %98
  %100 = fsub double %85, %97
  %101 = fadd double %100, %99
  %102 = fadd double %95, %87
  %103 = fsub double %102, %95
  %104 = fsub double %102, %103
  %105 = fsub double %95, %104
  %106 = fsub double %87, %103
  %107 = fadd double %106, %105
  %108 = fadd double %102, %101
  %109 = fadd double %96, %108
  %110 = fsub double %109, %96
  %111 = fsub double %108, %110
  %112 = fadd double %107, %111
  %113 = fadd double %109, %112
  %114 = tail call double @llvm.fabs.f64(double %36) #4
  %115 = fcmp oeq double %114, 0x7FF0000000000000
  %116 = select i1 %115, double %36, double %113
  %117 = fcmp olt double %36, 0.000000e+00
  %118 = select i1 %117, double 0x7FF8000000000000, double %116
  %119 = fcmp oeq double %36, 0.000000e+00
  %120 = select i1 %119, double 0xFFF0000000000000, double %118
  %121 = fsub contract double %26, %120
  %122 = add i32 %24, %27
  %123 = icmp slt i32 %122, %2
  br i1 %123, label %25, label %124, !llvm.loop !24

124:                                              ; preds = %25, %0
  %125 = phi double [ 0.000000e+00, %0 ], [ %121, %25 ]
  %126 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ9device_llvE10partial_ll, i32 0, i32 %1
  store double %125, double addrspace(3)* %126, align 8, !tbaa !22
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %127 = icmp ult i16 %8, 2
  br i1 %127, label %140, label %128

128:                                              ; preds = %124, %138
  %129 = phi i32 [ %130, %138 ], [ %9, %124 ]
  %130 = lshr i32 %129, 1
  %131 = icmp ult i32 %1, %130
  br i1 %131, label %132, label %138

132:                                              ; preds = %128
  %133 = add nuw nsw i32 %130, %1
  %134 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ9device_llvE10partial_ll, i32 0, i32 %133
  %135 = load double, double addrspace(3)* %134, align 8, !tbaa !22
  %136 = load double, double addrspace(3)* %126, align 8, !tbaa !22
  %137 = fadd contract double %135, %136
  store double %137, double addrspace(3)* %126, align 8, !tbaa !22
  br label %138

138:                                              ; preds = %132, %128
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %139 = icmp ult i32 %129, 4
  br i1 %139, label %140, label %128, !llvm.loop !26

140:                                              ; preds = %138, %124
  %141 = icmp eq i32 %1, 0
  br i1 %141, label %142, label %148

142:                                              ; preds = %140
  %143 = load double, double addrspace(3)* getelementptr inbounds ([256 x double], [256 x double] addrspace(3)* @_ZZ9device_llvE10partial_ll, i32 0, i32 0), align 16, !tbaa !22
  %144 = fptrunc double %143 to float
  %145 = load float*, float* addrspace(4)* @d_mse_out, align 8, !tbaa !20
  %146 = zext i32 %4 to i64
  %147 = getelementptr inbounds float, float* %145, i64 %146
  store float %144, float* %147, align 4, !tbaa !27
  br label %148

148:                                              ; preds = %142, %140
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { readnone }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = !{!12, !16, i64 12}
!12 = !{!"hsa_kernel_dispatch_packet_s", !13, i64 0, !13, i64 2, !13, i64 4, !13, i64 6, !13, i64 8, !13, i64 10, !16, i64 12, !16, i64 16, !16, i64 20, !16, i64 24, !16, i64 28, !17, i64 32, !18, i64 40, !17, i64 48, !19, i64 56}
!13 = !{!"short", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !{!"int", !14, i64 0}
!17 = !{!"long", !14, i64 0}
!18 = !{!"any pointer", !14, i64 0}
!19 = !{!"hsa_signal_s", !17, i64 0}
!20 = !{!21, !21, i64 0}
!21 = !{!"any pointer", !7, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"double", !7, i64 0}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
!26 = distinct !{!26, !25}
!27 = !{!28, !28, i64 0}
!28 = !{!"float", !7, i64 0}
