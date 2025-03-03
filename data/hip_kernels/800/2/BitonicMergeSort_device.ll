; ModuleID = '../data/hip_kernels/800/2/main.cu'
source_filename = "../data/hip_kernels/800/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@shared_data = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16BitonicMergeSortPfS_i(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = add i32 %11, %4
  %13 = sitofp i32 %2 to double
  %14 = tail call double @llvm.amdgcn.frexp.mant.f64(double %13)
  %15 = fcmp olt double %14, 0x3FE5555555555555
  %16 = zext i1 %15 to i32
  %17 = tail call double @llvm.amdgcn.ldexp.f64(double %14, i32 %16)
  %18 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %13)
  %19 = sub nsw i32 %18, %16
  %20 = fadd double %17, -1.000000e+00
  %21 = fadd double %17, 1.000000e+00
  %22 = fadd double %21, -1.000000e+00
  %23 = fsub double %17, %22
  %24 = tail call double @llvm.amdgcn.rcp.f64(double %21)
  %25 = fneg double %21
  %26 = tail call double @llvm.fma.f64(double %25, double %24, double 1.000000e+00)
  %27 = tail call double @llvm.fma.f64(double %26, double %24, double %24)
  %28 = tail call double @llvm.fma.f64(double %25, double %27, double 1.000000e+00)
  %29 = tail call double @llvm.fma.f64(double %28, double %27, double %27)
  %30 = fmul double %20, %29
  %31 = fmul double %21, %30
  %32 = fneg double %31
  %33 = tail call double @llvm.fma.f64(double %30, double %21, double %32)
  %34 = tail call double @llvm.fma.f64(double %30, double %23, double %33)
  %35 = fadd double %31, %34
  %36 = fsub double %35, %31
  %37 = fsub double %34, %36
  %38 = fsub double %20, %35
  %39 = fsub double %20, %38
  %40 = fsub double %39, %35
  %41 = fsub double %40, %37
  %42 = fadd double %38, %41
  %43 = fmul double %29, %42
  %44 = fadd double %30, %43
  %45 = fsub double %44, %30
  %46 = fsub double %43, %45
  %47 = fmul double %44, %44
  %48 = tail call double @llvm.fma.f64(double %47, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %49 = tail call double @llvm.fma.f64(double %47, double %48, double 0x3FC7474DD7F4DF2E)
  %50 = tail call double @llvm.fma.f64(double %47, double %49, double 0x3FCC71C016291751)
  %51 = tail call double @llvm.fma.f64(double %47, double %50, double 0x3FD249249B27ACF1)
  %52 = tail call double @llvm.fma.f64(double %47, double %51, double 0x3FD99999998EF7B6)
  %53 = tail call double @llvm.fma.f64(double %47, double %52, double 0x3FE5555555555780)
  %54 = tail call double @llvm.amdgcn.ldexp.f64(double %44, i32 1)
  %55 = tail call double @llvm.amdgcn.ldexp.f64(double %46, i32 1)
  %56 = fmul double %44, %47
  %57 = fmul double %56, %53
  %58 = fadd double %54, %57
  %59 = fsub double %58, %54
  %60 = fsub double %57, %59
  %61 = fadd double %55, %60
  %62 = fadd double %58, %61
  %63 = fsub double %62, %58
  %64 = fsub double %61, %63
  %65 = sitofp i32 %19 to double
  %66 = fmul double %62, 0x3FF71547652B82FE
  %67 = fneg double %66
  %68 = tail call double @llvm.fma.f64(double %62, double 0x3FF71547652B82FE, double %67)
  %69 = tail call double @llvm.fma.f64(double %64, double 0x3FF71547652B82FE, double %68)
  %70 = tail call double @llvm.fma.f64(double %62, double 0x3C7777D0FFDA0D24, double %69)
  %71 = fadd double %66, %70
  %72 = fsub double %71, %66
  %73 = fsub double %70, %72
  %74 = fadd double %71, %65
  %75 = fsub double %74, %65
  %76 = fsub double %75, %74
  %77 = fadd double %76, %65
  %78 = fsub double %71, %75
  %79 = fadd double %78, %77
  %80 = fadd double %73, %79
  %81 = fadd double %74, %80
  %82 = tail call double @llvm.fabs.f64(double %13) #4
  %83 = fcmp oeq double %82, 0x7FF0000000000000
  %84 = select i1 %83, double %13, double %81
  %85 = icmp slt i32 %2, 0
  %86 = icmp eq i32 %2, 0
  %87 = fadd contract double %84, -1.000000e+00
  %88 = select i1 %85, double 0x7FF8000000000000, double %87
  %89 = select i1 %86, double 0xFFF0000000000000, double %88
  %90 = sext i32 %12 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !6
  %93 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_data, i32 0, i32 %4
  store float %92, float addrspace(3)* %93, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %94 = fcmp contract ult double %89, 0.000000e+00
  br i1 %94, label %95, label %98

95:                                               ; preds = %108, %3
  %96 = load float, float addrspace(3)* %93, align 4, !tbaa !7
  %97 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  store float %96, float addrspace(1)* %97, align 4, !tbaa !7
  ret void

98:                                               ; preds = %3, %108
  %99 = phi i16 [ %109, %108 ], [ 0, %3 ]
  %100 = zext i16 %99 to i32
  %101 = icmp sgt i16 %99, -1
  br i1 %101, label %102, label %108

102:                                              ; preds = %98
  %103 = shl i32 131072, %100
  %104 = ashr exact i32 %103, 16
  %105 = udiv i32 %4, %104
  %106 = and i32 %105, 1
  %107 = icmp eq i32 %106, 0
  br label %112

108:                                              ; preds = %136, %98
  %109 = add i16 %99, 1
  %110 = sitofp i16 %109 to double
  %111 = fcmp contract ult double %89, %110
  br i1 %111, label %95, label %98, !llvm.loop !11

112:                                              ; preds = %102, %136
  %113 = phi i32 [ %100, %102 ], [ %137, %136 ]
  %114 = shl i32 65536, %113
  %115 = ashr exact i32 %114, 16
  %116 = shl i32 131072, %113
  %117 = ashr exact i32 %116, 16
  %118 = srem i32 %4, %117
  %119 = icmp slt i32 %118, %115
  br i1 %107, label %120, label %128

120:                                              ; preds = %112
  br i1 %119, label %121, label %136

121:                                              ; preds = %120
  %122 = load float, float addrspace(3)* %93, align 4, !tbaa !7
  %123 = add nsw i32 %115, %4
  %124 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_data, i32 0, i32 %123
  %125 = load float, float addrspace(3)* %124, align 4, !tbaa !7
  %126 = fcmp contract olt float %125, %122
  br i1 %126, label %127, label %136

127:                                              ; preds = %121
  store float %125, float addrspace(3)* %93, align 4, !tbaa !7
  store float %122, float addrspace(3)* %124, align 4, !tbaa !7
  br label %136

128:                                              ; preds = %112
  br i1 %119, label %136, label %129

129:                                              ; preds = %128
  %130 = load float, float addrspace(3)* %93, align 4, !tbaa !7
  %131 = sub nsw i32 %4, %115
  %132 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_data, i32 0, i32 %131
  %133 = load float, float addrspace(3)* %132, align 4, !tbaa !7
  %134 = fcmp contract olt float %133, %130
  br i1 %134, label %135, label %136

135:                                              ; preds = %129
  store float %133, float addrspace(3)* %93, align 4, !tbaa !7
  store float %130, float addrspace(3)* %132, align 4, !tbaa !7
  br label %136

136:                                              ; preds = %129, %135, %121, %127, %128, %120
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %137 = add nsw i32 %113, -1
  %138 = trunc i32 %113 to i16
  %139 = icmp sgt i16 %138, 0
  br i1 %139, label %112, label %108, !llvm.loop !13
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
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
